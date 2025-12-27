Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD5CE8FDB0
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 04:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BEEC80DC9;
	Sat, 27 Dec 2025 04:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOOm6sA0D0zr; Sat, 27 Dec 2025 04:22:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45A2580DDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766809369;
	bh=+l3mCiz+tsZNXc526ZE+/FDMuAy58SlnHyy4L3yVKys=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NwV1d3z+rL2D1UQELuax4tkjVomJtxSrcQEM+DZiQyagp4mxfIoFxoydQvqA9Zk4O
	 1Oh8GHn2yO9NizadME/Yw+twkSfGYdT5tUyru/E5yCBhb7E8nNSai32WjEoPys1rKT
	 A/HRnkQ2PpahBq4QQFdj3blxvoDgx5U3nxOpQjjOnwGGqA+Lr7fdHSnu7gNc/K+QwX
	 u+BLKCcxJw4Oy5C+rbHRPSUZhrYtEzFB74ptoP9BLB2/iimDMRerAtZ3o8c7BJq25l
	 w373Hf2xLmIBYmbjU4uWFvV3IVA8JOj0zU9aPpQYKCBWMagb1HNsDCk/cIfEKqhuDG
	 yi6L+rihzDt/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45A2580DDF;
	Sat, 27 Dec 2025 04:22:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3670119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 04:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAD2280DDF
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 04:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyvB97t50hHV for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 04:22:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E91780DC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E91780DC9
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E91780DC9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 04:22:45 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so60530415e9.3
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766809363; x=1767414163;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYxNzqcWjqeI/i1BLAJRZepkl3GxDVN01C5cnGk9GJc=;
 b=fBK5AxnIqOlGQ3/cxvIoBJrmLMyNNGxeUZPQneQeuXmf+BX6zdOn0E9VBRXrMQJKTL
 apZ1p6mYqmexH31/HrgXUwR3bAR3Ym8Ys5YXsyccaPJZMNzPc5vhpv5bTYQassvXuLKD
 Vo9+F3LL+RKs/eT/1RZgpwIR1pq8bfRkFyjikcH+rIWWafkk1FZhakXkXcyya6HyAGjy
 5uIR6J8kd9uFBNbxcqXaf8mBSwPrJI4elAeUNLiqg9I18J6LDsemoU5RU1MySdIIzCia
 nO2+8tYPsU7Ge1qo7QFPTEGEUu/yFvu2H1qTsCsB7mo+5pHVjDTWCLjD4FYcbFfHkAbm
 y69w==
X-Gm-Message-State: AOJu0YzxjdWrURokDffu9XIXuTUcghpsjSLUsf8DlBUY77Lvh1HZ5dJY
 EPiUSy+SUUGQAcJ57RJ0zK7PKrbpWLYSiBLXsgUX5hfRSeNSxF0tsWsI29zaCg==
X-Gm-Gg: AY/fxX4xDMBndprUG/CCjdYgeX1xCN6LY7qu6NIyKvlNuc//xJlMA7BnwbCpgxPqqsY
 1kTDeO5bKpj0ggkvUYGUT8zekTJj6R4MDdTFpkHVl7sI6vd2lwutdDPCxjjnv7gKRFMW8lNT7sx
 v9buRlt4BLDXNj+GS55eydwCDmudNtMP1ByOvIH/k52enIcXOGH+LCB0zH/kBN14CTAM8BHRDpD
 aYYrMwNVmLeectalXsKBSBvuLD5DpHuk2T2Galbev5ForVe7qmz9wBqVQQc8dUMZ+4lgOkbBeCj
 1GhPvxNYmA6MAF1AyuHwRikjhI8fRDkf/dZR6mUYQ7WLk0Ktqf6SNVoGVy4jYEkezUTbyWaXDHb
 gjRZVoIHsUWCbyy/ZENRb+edY4ERbHLgLMiplFFzljmC1jgFJwESYmiCaAEan5YfbZSITFr6GaJ
 a2T/uhZcU7UEJLvA1KSw==
X-Google-Smtp-Source: AGHT+IFv4Kx1Wfz2W7hFhBL+pptURcmyZh3KgYEbKKbQEYNLvXQCmzX89aI0ZlyRBE9007/+qmV4ow==
X-Received: by 2002:a05:600c:3486:b0:477:54cd:200a with SMTP id
 5b1f17b1804b1-47d19549631mr263019185e9.6.1766809362880; 
 Fri, 26 Dec 2025 20:22:42 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be27b749esm477807965e9.14.2025.12.26.20.22.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 20:22:42 -0800 (PST)
Message-ID: <694f5f12.7b0a0220.23dcf7.94c7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 27 Dec 2025 04:22:42 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766809363; x=1767414163; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jYxNzqcWjqeI/i1BLAJRZepkl3GxDVN01C5cnGk9GJc=;
 b=ejneIBCQalmSp5DXl6KKAINhHmXtDwb0sQ5+ISEG9oAmty7O9K7iMtINEYIzEyGVcY
 Ep6zcrCoGchae1nYX2h5Eo+OCg6Yng4AZ4IVLV0hms8j8smNSnCeDYhznP1NvqoaRXBL
 sKP/DsiKONZWOg+Kt69O7g9DiUDHzfsDyAwqheYrEM1Ro+FDFb0Jtn1tpvOwGMrp36jx
 6uyLXB16merfOVTzEJ9TJhkRdNRvvnYmuTuy82ivfOIaGnN6wuP86rpgi+iJFN9XQ840
 ey75ZmswnGrqzr3ORVxbg8DVMgQenvKkd+BtZ6mQ7D5j4kSIKLumykwWReqG+BXVZbC8
 wWWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ejneIBCQ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-26
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

Autobuild statistics for 2025-12-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 14  | 47  |  0  | 61  |
  2025.11.x  |  9  | 16  |  0  | 25  |
    master   | 48  | 166 |  0  | 214 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.9 | 18
                libselinux-3.9 | 16
                  libcgi-1.3.0 | 9 
                   dash-0.5.13 | 8 
                 jasper-2.0.33 | 8 
                       cfm-0.3 | 7 
                   cvs-1.12.13 | 6 
                libcuefile-475 | 6 
                       unknown | 6 
                  brotli-1.2.0 | 5 
     libphidget-2.1.9.20190409 | 5 
glibc-2.42-3-gbc13db7393773... | 4 
linux-serial-test-bf865c37c... | 4 
                openobex-1.7.2 | 4 
  gobject-introspection-1.84.0 | 3 
                 libuwsc-3.3.5 | 3 
                  cairo-1.18.4 | 2 
libcorrect-f5a28c74fba7a997... | 2 
                  libsvg-0.1.4 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                netdata-1.37.1 | 2 
                   perl-5.42.0 | 2 
alure-14beed2a86d5a36030e90... | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             berkeleydb-5.3.28 | 1 
                 c-icap-0.5.10 | 1 
          cloudflared-2025.8.1 | 1 
            cppcms-2.0.0-beta2 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                     crun-1.24 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
                    dpdk-25.11 | 1 
firmware-utils-c42a3bc53da8... | 1 
            gdk-pixbuf-2.42.12 | 1 
gli-779b99ac6656e4d30c3b24e... | 1 
                  hostapd-2.11 | 1 
            igd2-for-linux-2.2 | 1 
                   iotools-1.8 | 1 
                  iozone-3.508 | 1 
      ipmitool-IPMITOOL_1_8_19 | 1 
libfutils-c326ce0cc2a735438... | 1 
                 libiqrf-0.1.2 | 1 
                  libite-2.6.1 | 1 
              libopenssl-3.6.0 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.18.2 | 1 
                   lsof-4.99.4 | 1 
                    mpir-3.0.0 | 1 
neon-2-sse-097a5ecacd527d5b... | 1 
                openswan-3.0.0 | 1 
          perl-net-ssleay-1.94 | 1 
                 procs-0.14.10 | 1 
python-remi-2022.7.27-37-g1... | 1 
               python3-3.13.11 | 1 
          sane-airscan-0.99.33 | 1 
          sphinxbase-5prealpha | 1 
              tailscale-1.78.1 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
ustream-ssl-68d09243b6fd447... | 1 
             util-linux-2.41.2 | 1 
                  vsftpd-3.0.5 | 1 
                   wmctrl-1.07 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/63bd1274e4cb6ca4f2e2f40de78adfe3a0a12b15 |     
powerpc64le  | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/4be56ccb74a718d9a5687f429f62f8ca5ab55966 |     
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c832f0a4c3c93e5aa6b1cef5dbdffad3c2e1503e | ORPH
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/a33ced9b55ac6abf672eb70f65e5b8dca52208cb |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/4e813dd369998ce67922983429ecade2ca91d9b8 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/41d71a866f497579b83b8bc506eda5d679ff0027 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/7c2a163dbd0c18f6f8beabf88ab81066a740c14d |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/2e86f5d46f0c101826ac31aa0358bad4dd6b6f10 |     
 aarch64_be  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/248f0f9ae243ed9cb025ca767523fd76c7de4dfc | ORPH
 aarch64_be  |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/79e713c9ff86aff06d18b3cc706941d65cf9f32e |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/4f6590da68a80331088bbc096f7d7163f9e45b23 |     
   mipsel    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/61f4f9730361d2d4e7bc2bb9454f33ba2987d3f2 |     
  powerpc    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/e79d676cf77dab3b0deb88788552ea4566ef96be |     
 powerpc64   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/dd65afe33a6e15b59ca11d81d1c3e1e92aa68e3e |     
   x86_64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/c29111f2d60b0f4a48ba4530273f9324b98e00cf |     
    m68k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/38815d7f005ce12a0d0ebb18dc338ea63fc2b77b |     
    m68k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/5bc7a204be8f8c657af9f673d702614801c28c50 |     
    sh4      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/219899e61e0619a5aac365b538cbc61d2593408e |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/fc6b7ace6fcbff9a76245650d94ce8d42fc493b7 |     
   x86_64    |       cppcms-2.0.0-beta2       | NOK | https://autobuild.buildroot.org/results/c9bd36e523905068ff553a85ead5411dbd0139c4 | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/355ceabc64f9b942c5900590457f542a25e4cd0b |     
 aarch64_be  |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/78356fb16906ee11c2a105f873d6b6ff08bd7988 |     
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/72c2898c4c0da60d62ae4360b608e88efa035c7f | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1a36693a95bd0df22fa134c78bf70f238f664630 | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/87069bcd04b455b9137813c9ba5be5087fabe8e3 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/805ad7e7354e09b8d1073c60673c23da03b0ab9e | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5df512f4e62762ddc075892ddf2d3d66fd8b4e62 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/15a068a79c911b875d43c12fb0e9928b5659ba1c | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b7a2c9ca784eac745701957157ad2f565286f3f1 | ORPH
    arm      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/02688dffd73e6c2587c3520d14b2e2fa4b9d1031 |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/e9108ebd9fb8c471add1c5a7f581757175fa5f15 |     
   x86_64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/756096312eda030d3ce683d1b513f025fdd1b765 |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/43eeac756443d5d3422069e94ba29504d697e764 |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/f082416e5e365762bbcace6e50f7c67d94a52b02 |     
    or1k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/8aabbfbe5a82f366805c85ce5f2dbd7319e1a155 |     
    or1k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/0dffc78908aa7570bf51d7b089d66014d40673c1 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/f36348dec164a9c630f3ce3909b908e14859f3c2 |     
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/f2507141ed8c29751d234bfcc8d30720ffcdb96e | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/1c58b0ff16c9e25a2b80840c954801245dda46b8 |     
   mips64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/dad068c2ad38967ed8510a9c583f83582ba28dcb |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d9c30883167dbbc819623a4d9ca1933daf142a12 | ORPH
  sparc64    | gli-779b99ac6656e4d30c3b24e... | NOK | https://autobuild.buildroot.org/results/30c1645d04b9d2b581aa7a866aa19c4001538e17 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/81083f7c71e93d163e1b8b324a1cb486ba045f47 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/377f86cd28ba5909cf9a5651c81e18ca71ff9c93 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/56a6c66d8160c13d7da990f4317d743b509833aa |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/bd608502d705954c34b4affba468ac3b4a8576c4 |     
    or1k     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f92d4b48c0a8d4babac0e6456ba2b6c344909c6a | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5a4f7fea9927ccd6b4e60e916a2a32f2e336f14e | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/247a4e64b2e5e2c886b1d3ed126be6f7c4c15722 | ORPH
   x86_64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/5cfbc6cbd58bf759987baf06afda5ba9e878d40e |     
   x86_64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a8f83f6a4c795668e2a1bc6bacc1bcf865f52aa2 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/bdb0fca5f708629c1a222c0111d036ecebf5cce0 |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/b1d366b04d78f94b5bc991189845597fe86fe777 |     
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0e9de0c0d8b6ec57eea9f8834f02076b296ba4f1 |     
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/e859c30571ac788ca7d681afa037f56f133dd388 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/9ea2681ade20243c3231065411e2efe0cd509655 |     
  riscv32    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/d2cfc86de5223bc3376cfb6ddfddc786d844c397 |     
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/fa026c11f0f02726c6da829e91897dc78b2a8695 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/725d42de70bbf764bcf7ce77cca884015bcc3201 |     
   x86_64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0cc6c885ce6f20f5860f2fdf93f85afcfc7256da |     
powerpc64le  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/532a802754205e37aced8cd5c23d0c6c4dc357f4 |     
    i686     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/6baff230f876995f6f083e431a9103b7981eb6be |     
    or1k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a6bc22e184e2f908c6ba0471d01d3cb43f09da74 |     
  powerpc    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/bf2e99a940a625c49f0903c8940ef04714d8ec56 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/bc30dabedd83bef439737d3af81877570a690b77 |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/45db9180013b230c652b928057c6d4c6f00db96a |     
   x86_64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/6896b9b6fab0eeaee4a0589e73b2542ab1376bda |     
loongarch64  |          hostapd-2.11          | NOK | https://autobuild.buildroot.org/results/03ad7aff8009a8601d418f53fd8fbfffde822f34 |     
   sh4eb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/3292262c67d0e2ba3a65bf1da3d717e5264f8d83 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/043f6505e382eae8abe852aeedc148be5313bf29 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/805d2e824bebeb88a3c6a8611f61f79ae0c9afbb |     
    or1k     |    ipmitool-IPMITOOL_1_8_19    | NOK | https://autobuild.buildroot.org/results/a309e5869bf67f5bc167632a45a9a08380fd5711 |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/7a8d9f00b56b17440e264b3f62a0469a15e6a90b |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/5bd42579a8543ed8d05fc1e368fcc947571da6d2 |     
 powerpc64   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/3284e444739029053d83c439b95cf689f4d7cb0c |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/3d52ffc2f53fb65ed553ceccf430cc14e092400c |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/be569f8a5944452d6142fe1db813b8a424076b85 |     
   s390x     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/120880a25bda3accd7df4b3d9089fa6b6f019218 |     
    or1k     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/07ba04a0f73c05edd018c4be800db426d1551f16 |     
   mips64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/d5ee027479add150404919b2bbe210f0c90f47ce |     
   xtensa    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/2b18bb2c5a627e74792f7bf9720db2dedab3a166 | ORPH
  mips64el   |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/d576f3f519537d34a91910c0113d0e6ecc02bb64 | ORPH
 powerpc64   |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/a85454f5f5b866414617b3110be9641c4067f9a9 | ORPH
 powerpc64   |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/7fb1c2a09572ca696554535f3b3530957c6cd44b | ORPH
   mips64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/628ec80b33f4ae66529557132d619744e36d09f8 | ORPH
 microblaze  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/c4b27dccfa271bee3fca43466b50921f41c323b4 | ORPH
  sparc64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/24c34a06bfb30f2cb8d246ef35d0fa0a6c9c9c69 | ORPH
  aarch64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/f1ddf3ffa35dd8818f2141817c5b632ef283c41c | ORPH
loongarch64  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/3b5e24143962d2d5e7ad97f5ee98c9ba3d53946f | ORPH
   sparc     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/58c68d07c6112e824ea48f5f155ecb4fe8da4d31 |     
    sh4      | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/a32b43314d73c037926d033319bc397be600e19a |     
   sh4eb     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/870b3237d84ce42e38db38457f313de214918454 | ORPH
microblazeel |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/b22bcc65d4153b67f54084e32ccf6fbf5d44fdd2 | ORPH
   s390x     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/6499250ee7745ed4da20eaa73f6d61e6c9392c99 | ORPH
 aarch64_be  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/6b680a7a4dd415910c8b30e711a3a0b63e48597e | ORPH
 microblaze  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/62511bb9359abb07d99d22d4fbed3f014194eb38 | ORPH
  mips64el   |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/ed516d7e61fb8c60e204113fb5bcf118d961559e | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/8993e86ca2b48f77fc9daf9c9d6e8d96ed92c8a3 |     
    i686     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/8625bb547562aa513cafce7d66e56135062bdad7 | ORPH
  riscv32    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/70ff4e5e371022101f066de27c4f8cc17570b2bd |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/1b7691f58e5418c08af7d365767d8a7e0d878b6c | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3212f1652b5ef3d9c4ef4d491e05616b5cef8573 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/563ada7fdb8453c14919bcb8865f777c6e63f828 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/730180fc06de90b14493cc6fd900dadd6c38627b |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d26e8c0dbf569d0ccacf191c9679020d3db60ee6 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/27a27be59799a089f33af46a4f0d2284c5855254 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/af53604a70f89a25ffb3a4f00712f3c274186a66 |     
    arm      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6542675577fe4e8dbfbeec854e97f07f5913160f |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/751c7df5fce6ef527e78a5b9440a9f85e564348c |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/289341de349eb3b691a6e1b867c967990b368d3e |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/d3ffabcbd2bfa48b785aa87989bd751ef0339eee |     
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b39daead2a8fccdc2baa71b3d367ea8cfe3658d1 |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/46609c71f0bf78b3b633b88910f532f596686ee4 |     
    mips     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/29e0eca8c1ad97c1622948b031a3a784b36ae2d5 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b9e90c7db8a92c6391317817c371e9afab50f5a3 |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0fe2ca2333b8717223e222db8df249328c8e1aaa |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b41b0422d7512a55e5146d7a05ebdfba171f34ff |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a7652f6526a9d87dbe41af4d754263f9159a11d4 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/630f0ec462e75066c8598fe832526545dfdcae7e |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/08d421c45936b6200f5296a87472b29884f17d45 |     
   sh4aeb    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/d5126fcce7e94921e4f4f4fa48ca1e299082dcf3 |     
  powerpc    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1721a589bb061b62418242d138daa32cb0cadebc |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/00862fe51b136025fae9e11dcbc86ba144f8def1 |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/8fe59e00f64c675baa86c9f668c39e54fab978b9 |     
 powerpc64   |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/60726060afb9bff2f621f948d5e3a2a4af5b5c69 |     
   mips64    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/e88ff9f8660c02d96ec7b56d4dcb21b179e69ca7 |     
microblazeel |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/b3e47fe5d5fb91bb4c9970f8c0f4298d88a863a3 |     
   s390x     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/de501985b54efc617147ab067416d6e878bb1e7d | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/52408aba28cfd5d6cefee182bfc86a3798a38e5a | ORPH
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5a19ed6ab2ae87165722690d64b50c5e617d84b8 | ORPH
loongarch64  |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/6ba147b74d27d050bb89acfc342b0e7b91ed5bdf | ORPH
   x86_64    | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/e99d42399e466185fa8e3a59a9c695f90befbae6 |     
 aarch64_be  | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/f90521b71255c3d419720fdf94735c0bcecc700b |     
   armeb     | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/1606ecf1fdd1f4c49ff33ea2f886531274e0becf |     
 aarch64_be  | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/7e9ec05d8a5c723f7724198b2be6395c60690db4 |     
  mips64el   |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/39c2d39d883b5bb1401413676e51a52922adac9e | ORPH
    arc      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ce2b45207858b9528a1c18b4a6fc8b53dab8b196 |     
    m68k     | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/5c9cd2e92e921015d8c01a1f3cbb93ceaf8bcb3c |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/46e8f05a794a214dede139dad8646a6614ba9475 |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/9652f40edc930fe07d71bbb6027417fed196c8df |     
 aarch64_be  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/c720814ce4001b1aae93a97cea4a60870e95d733 | ORPH
  mips64el   |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/2d75e505712307d18778781c5f93abddf4476976 | ORPH
   mipsel    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/187acf9e215da7833eede32a4f54affa5d38cf34 | ORPH
   sh4eb     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/c0d3ba4b4aeae769ce6b53a913b161355d4bd173 | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/2500a63ffce807771cb599b46e79e06954ffb5e7 | ORPH
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/f775e3fb8e0cc875021619d1b925a165fb8fe531 |     
    mips     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/56c910de9a512149d582bd77dc1a05dadd928257 |     
   x86_64    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/3f00ddd1cc070971865ded78b44369dcffcb2b50 |     
   s390x     |         procs-0.14.10          | NOK | https://autobuild.buildroot.org/results/edfbc38b0c04cb940a0bc0a3c148fdcedeb676fe |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/14a059c5e04e37564a186966bb65269c902d4c1d |     
   sh4eb     |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/0c67f0b7e4361c92277158dbeddecfebee803083 |     
    arc      |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/98be6688e3f4f8e20fedd0e2d44c7a8d8765cbef |     
microblazeel |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/6922ea4ec45ad7fc063e9cabfbbd4bf728a90fed |     
    arm      |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/bf75874af4d0fd3a981c946bd84e53ad3612b8e4 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/20a0b1b2fae843b82f9afb54205ca50baf92228c |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/622fec3621b422610934f62944ef4fa787e76a26 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/48a8f7219d16fe09db78198878f9ca3157613a6d |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8bab99ef5850ee67b30120e82c979f619ea65536 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/eab905c4f28205868cf2e6c3554d91bd6525ae29 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/3b7390cbba65dc4f51756663e036df71838d4673 |     
   armeb     | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/118c0401af37a4182f8879d76e3475996856604b | ORPH
 microblaze  | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/667efc853f71eb95d760249bd1dcf21fa066d24f | ORPH
  mips64el   |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/2a65e36869b94ef8ca4d9bced0469bd13dcf0982 |     
  sparc64    |          vsftpd-3.0.5          | NOK | https://autobuild.buildroot.org/results/e1f4cbe256b6dd1f28b795aa13779a581818b3a4 | ORPH
microblazeel |          wmctrl-1.07           | NOK | https://autobuild.buildroot.org/results/679a9f6224d1771ec2ab52e45fd74af8d03c1604 |     
    arc      |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/3da7ee8cd0e6d1a91f5a52077c0645e1b1e8e9cf |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                netdata-1.37.1 | 2 
               asterisk-22.5.2 | 1 
                 c-icap-0.5.10 | 1 
                   cvs-1.12.13 | 1 
                   dante-1.4.4 | 1 
                 dc3dd-7.2.641 | 1 
                     gdbm-1.26 | 1 
            gdk-pixbuf-2.42.12 | 1 
            igh-ethercat-1.6.3 | 1 
                libselinux-3.9 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20250530 | 1 
                openswan-3.0.0 | 1 
               pax-utils-1.3.7 | 1 
          sane-airscan-0.99.33 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/6bc7f091247761e3faad68cc1e81e4d846089a11 |     
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/783879abde97731bdd33d63ceace1bf8ea30266a | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a10cf1e8975165c00af0cf44703a77219fdaa573 | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b28e24fef566d100f2a529f5de8d8d3ce3410114 | ORPH
  mips64el   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/d964775f9b6e1aa801bdaec7e145339246805e3c | ORPH
  mips64el   |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/e6a8e73bab9408fb3cffa18471e0f4feeafb5108 | ORPH
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/01e5e01a046dc9d3c099cb035efbadcd65a46642 | ORPH
   s390x     |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/b8d2f2881b57d5b708ba143b4c903d6049490cc0 |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b776b7890856e7686ef56fcebfbe8ce45304669f |     
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f2dfd8f7644b53dbb4dc94c9d3b83b54eee536f4 | ORPH
  mips64el   |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/8adc8aadfd34658f607815acf60abb3fba2ff3a7 |     
  sparc64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/3b9c967c0c6f96f48bf610e5188527bf88c89fbb |     
  mips64el   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/f61b932efd49a235cc84522d2eacce15e4f599fe |     
    sh4      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/7cc39516c1fdd1cd1311c37a1dfaa0959175e12a | ORPH
powerpc64le  |        pax-utils-1.3.7         | NOK | https://autobuild.buildroot.org/results/40785620ba880cf2d508d9ddb1361e3531a9e4b2 | ORPH
    i686     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/0ad493441c9dfdc2ece061235c4974ae26d876a0 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 9 
                libxslt-1.1.45 | 6 
           host-go-src-1.23.12 | 3 
        ltp-testsuite-20250130 | 3 
                   perl-5.40.3 | 3 
                  ffmpeg-6.1.3 | 2 
              host-rust-1.82.0 | 2 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
                 coreutils-9.5 | 1 
           crucible-2023.11.02 | 1 
                espflash-3.2.0 | 1 
               freeipmi-1.6.14 | 1 
               graphene-1.10.8 | 1 
host-netsurf-buildsystem-75... | 1 
                  iozone-3.508 | 1 
                 libcddb-1.3.2 | 1 
                  liburing-2.6 | 1 
           libzenoh-pico-1.2.1 | 1 
                 mesa3d-24.0.9 | 1 
                netdata-1.37.1 | 1 
           oath-toolkit-2.6.12 | 1 
             parsec-tool-0.7.0 | 1 
               syslog-ng-4.8.3 | 1 
                       unknown | 1 
               zxing-cpp-2.3.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/2763bf49b3a1f6a35bd7a579d6e59557acdd27c5 | ORPH
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/b6f6915ce19227c4cbdc14b85c28ab893ab01f5e |     
   x86_64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/42562e83f366d4727dae6242bb7da403189bc3b0 | ORPH
    arm      |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/623068ee0cb0d288a5be90f4687751dc9ec2472c |     
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/775cc017aa487ac531312a667c196907a4a65153 |     
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/1d91d8de5652eb9cb403f79460fd22feb96bdd21 |     
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/843c295cf5f1852b096e7a0d5eb90a0733bfb196 |     
microblazeel |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/461931053cb04772317339257007765d473f933d |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/8bd352267c470996801100a7ff9a9ace0ed1381c |     
    arm      |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/96897f3c6ad33aa9612018b399db283a2e57a907 |     
  riscv32    |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/9bd603abc89bdd0c2e04f38e0c6addad465c5594 |     
    m68k     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/730de175c62c029a07ed73ea65ca0ae665257b92 |     
   x86_64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/23e26ba00d6a18cbb43b2cbbf724d7c100b12517 |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/bdba90200d4d8bccb39af749560a0305d50cff4f |     
   armeb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/b22093c816fbe35947289b6ffb92ee89661f54a0 |     
   sparc     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/b1e4dbf95241ac6b9c701821e1c62d5ecd39ff64 |     
    mips     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e52a0513fe249d49dfdc885f54e068794286b3f7 |     
   mips64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/12bc40cd392b5857156ca3dc86f4eca21db6b28f |     
    i686     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/8efbd87e9276769bef4c28101be456eda4094775 |     
    arc      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/254000e64626de62aaf7358085b74d4d6fb37e43 |     
  riscv64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/260ffa5cbe8589867eb685f8bbb6e775f345f5da |     
    or1k     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/80760f76f7f8e15daa02f2c8fa0b0b0f9b8b5135 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/00321d6b29b7b99fbf4b68b34d4813e92afcf2cd |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/67ca084f928cfacd925f6ff86a79d9e18e913770 |     
    m68k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/8509815c1a033dd92e973a349c02c9cb24cff3c8 |     
    arc      |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/6e7f97c305c618c888316a1902b3b4e53129bcca |     
   x86_64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/6e8f1e29200fac3ee02eada57512b0aba20e1903 |     
   s390x     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/e5f4fe71acd55965091738e55529c92d54eb5330 |     
   mipsel    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/a0f6a8b7508229bb5fe8a7a780b50d8a673563a8 |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/bca4c022f23fd5efb2a47263de02394e1573493e |     
 microblaze  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/fa671285e2c04d7bae581fa3e5df8271f69e4915 |     
powerpc64le  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/2b42164818f0d944bb7bdd4e825efbff1c27c876 |     
   mipsel    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/60fb3bff38e4b9820b08fa2240f48f9491ff718e |     
powerpc64le  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/f2a2721a464818662a0aee5a32deb2aa12a1d025 |     
 microblaze  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/87c0d7444fd7996bc9d4c8bc909cd19c517970d4 |     
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/9e3bba25c9d5b88ad3d07b80eff3013af7ed211a |     
  sparc64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/1eec853fc85b935ee4e2297b49df467b5a9a4267 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/65de90158f696d18ea5475ced416e354b0aaf7dd |     
    or1k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/784bd68a9568237335f6c4e72bb932e6db9005d5 |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/da8125a99a605ce3022008c0bfe3218ea052982d |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/05e23efa52ca29cd9ae4dd2c78383bdf2c7ac405 |     
 aarch64_be  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/803a5415e1c65f914330b26647b3619a0896bd80 |     
   armeb     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/140ad1535915c7596b9d0ba5a3c39a81c8c37db1 |     
    m68k     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/401796b96686e49269c5ebda8f1c2ab26af43500 |     
 microblaze  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/b7612a08d3eaf34df113846965471527e8cfd29c |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6de4bac9321ccce6d15aa22c28ba1fdf8e09be43 |     
   x86_64    |        zxing-cpp-2.3.0         | NOK | https://autobuild.buildroot.org/results/778833cec43b552e6cd25b0628cdda22d5253342 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

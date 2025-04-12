Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC92C369A2
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 03:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF6BA80539;
	Sat, 12 Apr 2025 03:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qw5PCTg4hNc0; Sat, 12 Apr 2025 03:14:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93A8B84076
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93A8B84076;
	Sat, 12 Apr 2025 03:14:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5301A108
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 03:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 396734090E
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 03:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUJl2Pke8rCW for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 03:14:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B5F1B409B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5F1B409B4
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5F1B409B4
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 03:14:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e6c18e2c7dso4793404a12.3
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 20:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744427694; x=1745032494;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MnzWTpc/LaeFKPui3uQNsWEgFi/fLx/vzz4RUCrb3mI=;
 b=dCD5WHDyu1GdQqwc5PvTNamEdCAsDCYgIkhmp7PKLzZWXddIPfTLoZS8xH7dO4uYWv
 LmdcTnGeDzs1jg5um1Tt0KVUx8X1aicCJ4Jtot0jEIlJvIZEglzEjtX2TMbSdduQSTse
 VVaIPjV/mWbJqevebOhdjRoG+kA5emTz9umCkW97DgqL7zo7x7vYOX6jt/YoyFqkUk65
 iT3um1JVgq7Q5uXIGL9jUjbwn/Xi5eOcVpKfn4/DqJk3Ab67KA484UmBTxjf1haSLEsG
 NddyDgClLYVM+J6yP4cnzNoPWJdzy33T+baa3Nck+A9eKgN9DcAgPsP57RQ0qUjSnXU7
 ADdw==
X-Gm-Message-State: AOJu0YyRgdGBGR6+tMEyO6UJY4RCxQARU6k+Fyyj7dsx7IFvlufbtvbW
 6uh8OTjpDCk/tBGM4Pvffp6cHftjgxX4oOyzjOBgAVv0YZWnFYVdAiTtbg==
X-Gm-Gg: ASbGncugVyW7+9uAZ5JEgXWBla5OFCnQ+GmHtHdJFhhFS8bGxANpQLwJ1QfKCp/SDnN
 O6DcOPO6NeSMTNFnD7ZmhVzSFN8/B5cUvwPohnz5Ozc4ZE3f1Fc6ORN3jlxqo6IHtHKLbLAady5
 alIwjaz3+m/ysWDwXFZFYnpnz158A/MiP35aaFLap0foFA3Vx9/i+s05DOjDo2zeCA+tG9AgOHL
 HIKO6rE+XkbOIw7QPEvP8qTEAMbalqq+2Nm2HzOwvOvevST0RDIKn5E9WXTwsREj3BFRjUQDKwd
 565U94vDyOQEOLe41a+hs1ASp8x0jslwJ39b0bpeZwis
X-Google-Smtp-Source: AGHT+IFDcaNmirB3WMsS5YUjE78R8c8lZPBqDbNKbJBEIWTfexDdJfsZ+ySBePbTkDR5rBl0mImghA==
X-Received: by 2002:a17:907:7209:b0:ac7:c66a:4702 with SMTP id
 a640c23a62f3a-acad36d9214mr414712966b.57.1744427693302; 
 Fri, 11 Apr 2025 20:14:53 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1be8d19sm526728366b.45.2025.04.11.20.14.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 20:14:53 -0700 (PDT)
Message-ID: <67f9daad.170a0220.39ac77.1a06@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 12 Apr 2025 03:14:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744427694; x=1745032494; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MnzWTpc/LaeFKPui3uQNsWEgFi/fLx/vzz4RUCrb3mI=;
 b=nJU4OQp0Je64XsI72OuT/S9qw+KgmCZ0CK4+zN5eO4hNuoKDisumJhye3rN6S7Jivd
 E8pq64GtJP8pFGbpxHRg6H46c/2kiTxW7xSbjwMMbMGJOc0CHbg0ebzvVjx822ojtNFp
 6P52MgJONPhuTuIbV+J1p9abhSgOp2RuCMrPwShQbXTFcliFpxRh4vhvA2RZKxNOukKR
 DSVFR4GnKIAJ9CCIQjl99xQ9pExI7U6xzFnZ2ECU4R550f6t4azViMYif00zhARrt5b0
 TjJxF9c7p0uxy087Y9xCpl/CBd/zRWAa/ipHrK1/qBMGBNTFdozlZNfrPMD79JNN1Fzy
 nS3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nJU4OQp0
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-11
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

Autobuild statistics for 2025-04-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  4  |  0  | 10  |
  2024.11.x  |  0  |  5  |  0  |  5  |
    master   | 16  | 60  |  0  | 76  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 4 
                 host-gdb-14.2 | 3 
           libzenoh-pico-1.2.1 | 3 
rtl8188eu-f42fc9c45d2086c41... | 3 
           at-spi2-core-2.50.0 | 2 
             bluez5_utils-5.79 | 2 
                elfutils-0.192 | 2 
              fftw-quad-3.3.10 | 2 
  gobject-introspection-1.82.0 | 2 
              host-rust-1.82.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-tools | 2 
               openblas-0.3.29 | 2 
                 openssh-9.9p2 | 2 
              asterisk-20.11.1 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                  bcusdk-0.0.5 | 1 
             dahdi-linux-3.3.0 | 1 
                   duma-2.5.21 | 1 
                 expect-5.45.4 | 1 
                      gd-2.3.3 | 1 
                   host-go-src | 1 
        host-sentry-cli-2.20.3 | 1 
                  jack2-1.9.22 | 1 
                libdrm-2.4.124 | 1 
                libesmtp-1.1.0 | 1 
                 libmbus-0.8.0 | 1 
                  libsepol-3.7 | 1 
                libsoup3-3.6.5 | 1 
          linux-5.10.162-cip24 | 1 
                     mtd-2.2.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.12 | 1 
                opencv3-3.4.19 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.1 | 1 
               procps-ng-4.0.5 | 1 
pthreadpool-560c60d342a7607... | 1 
               pulseaudio-17.0 | 1 
                       unknown | 1 
               valgrind-3.24.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/1205a5e4113806cf23cb5d7332b9fe971ff3f80e |     
  riscv32    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b6da6f51a8a06f2afda4969b1105c1b14583ff0b |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f4a049aa85a45f555801521e4a13d1fed2e83ecc |     
   mips64    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/e6a1f71508bd6ec9a90753b3dc5ce375ab1bcc42 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b062dce485e619fc579b04b592fbf2a00a043a85 |     
    arc      |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/8930f4e4a49fefb0066e56742383171a51f4e3ee |     
    mips     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/028d180d580817aea05914876121c739c431a44e |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/40bf99afe631d6922d1cef6e66ad1a963e6d5dd4 | ORPH
   mips64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/b08b7980ebd32ffcabbb9a7e81de2e8d14533386 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9a30998915c3097381cab5c69670f58f735c66a5 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/db54329de5d2871677a35ea79ad9198b61e51c58 | ORPH
   sparc     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/ad848881e502006e350ebb5499001fbfe2bf19fd | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/b6ceab50bcef428e4d30f4b74e6ea0c161fabdc9 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/ffccc54688c6c56183d02db6126f2d9b7bac3de8 | ORPH
   armeb     |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/4e2630d8fd8a0beca08ff6cfc54a67167b8bbdb8 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/275466d36aee35d38772d50cbaffd433c20612f3 | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/e51c07faddf6c207643ff5ceccd4e4f38b9dd0d6 | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/65a5e96a6174589edcfb06a67b563a3d5964857d | ORPH
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c2b7d39435713ed993cb0d0168bd525cd4262f14 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8efd8386deef169113111d0fcb0b625eefb37eee | ORPH
  riscv64    |          host-go-src           | NOK | https://autobuild.buildroot.org/results/59e065554460911041b97b292653436893bc9730 |     
 aarch64_be  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7c425480ed4b4fb8baf03a9afb4f67a5dd138860 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/56a13de5a390471dccf505126d5301f15f498bcc |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9c91e50996c84ab784c6c1afef82c0adc6669a20 |     
  riscv64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/6dbceecb78d013f6a64027dfc66588c045f1217a |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b956cf2cc043752aeaa23ed06b41831d2d72c722 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/57462dc2f92c20cf1765e62eeec9d9db560b3d24 |     
 powerpc64   |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/5f0742678de95a987accab127237743b4f5684fa |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/0145894e1f5b34a0ac63e78007058dc6f498175f |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/3007bc6f0ecdb6828b5036a4df5b3382b2ae9de2 |     
powerpc64le  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/f8dc80308739e781a1834c5ec540b97fe091ceef | ORPH
    sh4a     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/4438dfbca0aa7767d8c07ad9dbda9d8e8025b183 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/7805e9b6f57088f570dbff69fd8003915a037d31 |     
  mips64el   |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/2c3cd721ed0a97e693afc4a3e559f23c83b064a6 |     
  riscv64    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/562d8b6a3469b415a3137c6dcf6e57ec22c830ab |     
microblazeel |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/78bcb70a8e55591ca694e822bcda2bb2863fd216 |     
   sparc     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/060fa61b38d950ffe76a30016c8650ac827a2228 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e9941075ab75c702eb2809640ed6651da8a8711b | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0ae806d889536a353388ecdaec445ad453416827 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1754d5086c097e04bf096b23e1973d17f030b4ff | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/2f483a3d9b4d546957810a9756cd3dfeac0fc6c1 | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/476f352ee76849575dcee4bd8341d5bfb285dd02 | ORPH
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/2c1889fd129aa8c922ced82f7b65b07c33d94090 |     
 powerpc64   |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/0f339845e6ac9f6a971250fd352547cbf41f207b |     
  mips64el   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/947b1444a4c5182291181b9c2dbe5e2a2936f6d6 |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/02d29692ed4ea36f3985ada5ff7c005b7c677619 |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/6e9db5bfe5a55173f1d48ebb746737ff9d0c08fe |     
  mips64el   |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/7b0faa9149847f3d83003622f9fce0bd4caf28ed | ORPH
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/452455f6c05f301d30a3b85980fbbadb8791703f | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/1e432196bb4131dd2a6ea47c816406b01bb8e72f | ORPH
    or1k     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/646c578b6f17b67f3c973647249f2440c47931f6 | ORPH
    mips     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/f0ba8d6f691e8a06832f7fa1df41410a586d5eab |     
  powerpc    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/21fe51cf2bf3147fe0005db96135a224f09e8eb4 | ORPH
   armeb     | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/08ccb35c11584f34bdf638069f8539b109053fee |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c51ca94ff8f6160ad919175310b12d92f4e7adb7 | ORPH
  mips64el   | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/1eb32fa9f7688728b5e79a0972e4a0cf8114f475 |     
  sparc64    | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/4a0ebbcd62a2bfc59a7f6183f100f0e111cee750 |     
  sparc64    | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/e769d9088009ea095b2dac9896f8aee54028a015 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8bfa67bf08adf83d82732b19fa9fe920099a8c9b |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/7316dca1e5b7b467e66e1826bfc9c2534fb9043c | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

dvb-apps-3d43b280298c39a67d... | 1 
                mongodb-4.2.18 | 1 
                    php-8.2.28 | 1 
                     shim-15.8 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | dvb-apps-3d43b280298c39a67d... | NOK | https://autobuild.buildroot.org/results/a6dd410cbc9141dedff9a6e303af435b0f24db92 |     
  aarch64    |         mongodb-4.2.18         | NOK | https://autobuild.buildroot.org/results/f4a52b75b9395f6732a5d99e6edd6237d5fc336a |     
   sh4eb     |           php-8.2.28           | NOK | https://autobuild.buildroot.org/results/f0625cd8bd58da5e52745714b218a2e9ef2f71d8 |     
  aarch64    |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/5cfe8506c15bd9fef11be630b08eabb7d7186649 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                 libmbus-0.8.0 | 1 
                  ntp-4.2.8p18 | 1 
                   perl-5.40.0 | 1 
            quickjs-2024-01-13 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/517e87ab46fb06e5c5d92318472f488a2ff2ba1a | ORPH
powerpc64le  |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/6ec6365fc25a3fbaa490555fbc34b34daf939451 | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e98c2557bd4b6b5565423bd32831a716e77d8395 |     
  mips64el   |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/9706c0031c033dd6c73a01f222a4d2a4c11dfa09 |     
    or1k     |       quickjs-2024-01-13       | NOK | https://autobuild.buildroot.org/results/f406fb755f82c4c11a98b1390da6b8de145db78f |     


Gitlab CI results for 2025-04-11
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166573  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166658  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166666  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166675  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166688  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166798  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166822  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166845  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166853  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166857  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166863  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166871  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166873  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166877  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166883  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166887  |      
                engicam_px30_core | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677166891  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167017  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167019  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167023  | ORPH 
           friendlyarm_nanopi_r3s | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167040  | ORPH 
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167050  |      
                 hifive_unmatched | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167053  | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167108  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167199  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167231  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167238  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167258  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167264  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167367  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167387  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690360330  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690360467  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690363677  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690363808  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690363941  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690364134  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690364277  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690364370  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690364406  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690364495  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690364729  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690365885  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690365983  |      
                   stm32mp135f_dk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690369624  | ORPH 
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690372425  |      
                     ti_am62px_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690373039  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690374450  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690374871  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9690375512  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

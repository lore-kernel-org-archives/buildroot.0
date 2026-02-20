Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43A9C531F8
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 04:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36EAE60ED7;
	Fri, 20 Feb 2026 04:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6YuiHRIWqGs; Fri, 20 Feb 2026 04:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFEFA60F61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771561412;
	bh=CvJsQnoJpDJXX7oC/g9L15GFQy7ts8HzR9Fi4u1+rUw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ch4QV6fDGqTftXgV7JKZvdl/vFeylMEVqFwQRM9ZtYLB4yQ1ajdiS3Wc51e5g/XMa
	 V1YhhkMTtu8bdp4mrYNnjNLQMC0F5d3CDMgRo4kPcKj8fMb7m1aswNm4j9+qSCXAiB
	 l2EAis29TBOCMi1E2k6oxGkrfSuvSYMxaZd3eXVMYDSNQEY84WoHA3rwQQ753BdYbc
	 oatmtpKuqAau4f60spE/eO9QIw1p7r2n4D3hmviiycsWytmMVaUM1LSgezQhLYP/ua
	 8HY4xplM7WY16Y4xhaezm0OyiTad/o20IF+BNwaxz6vz75TbdOa2j7UsP5iDwutJJI
	 4L8n7KIM5iyAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFEFA60F61;
	Fri, 20 Feb 2026 04:23:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38482355
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 04:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 356BB40C73
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 04:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zew05qOF7gRL for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 04:23:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A487340C6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A487340C6E
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A487340C6E
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 04:23:28 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48069a48629so16301565e9.0
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 20:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771561406; x=1772166206;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6QL3/ZthZiPl44FMOlTJT+WefR1/4VrVnmJIuj1B8Y=;
 b=eXPFi+zbAxdddrnU3UC9GPsPtPktINW17xrCnAdLCq6F8RdnbD2OqZmzn/CybhbPT7
 BJ3L7dT9Y5co/n+m0It5VtLkgukn7YliDQSfSIMl2eSzlpCSCPxPv7AZAgLUwOEOYH3c
 Rny6jqB7hNpcWf61Q96cP0A1n9vCnkV3FMhTu0ko4SBMOiHf7oFpOMMdV6y7n8S6DvN+
 gHmsJYPiNCWsgkheZG5uylftGM+zsXC6DBhGNsHq5M0i7V6MPF6M22UcKJYIqqGuHuFw
 oXpNsCxNGDMhqCzjro0EQRoeEYGD7Z4D7N28V0XoCehQ3UhqLByHp6HTLkVBEUOd7MGH
 +YpA==
X-Gm-Message-State: AOJu0YxLkFpC1Gyk4JXbAr2Asz1vslbQENflrvrIYdMxWJ+QS6kuQasd
 DeB2Q/v6V0dFKrI79lmQ3/ZYjBlO9L0c/WGDqoh+WV621PDNxtEnXsb+cEpubuW7
X-Gm-Gg: AZuq6aIRoU54rjWG7WcDhhmlucCikVElJqyZxqqmw5evH3AJWFtBAZ5dkzTpefpn0Jx
 dT6r51dCGlq2WE/C52n+XAwBg9/CCS02ssUoYbPj9FXONjDHWFiXkata+NH0xDMzW07MmjorJmn
 hGq83/F4sOgF0Ivh61MgfJKx6K5/UBIQSzCj1ZMZCI3Lm33BnsawBSGWvbsPk1Lf2NbNjz2GXCu
 X2bfsi56LP/IhO8tYwO6nD/corughz0M6+szvg6Fc8DcNNpLHpBcw8cHLuXOLTuXdOk/7sRvPf7
 nzRHc3yzFM9IRh8PypDBgVDyFJlLf+9fLMzW5ovrak1AjwxxXCUFhEADj2P+aq/Wba+Kj9jqLBv
 6FV613p1R7CsIo2hc9/Vyxp1eVJdE6GGR6dcDeJQh8YMuoNd3oUZXtxObIFCfMqPpgBllmzp9yf
 KbNL5oOqtzPaTl30mqxy0v60XF3h/aSA==
X-Received: by 2002:a05:600c:c16a:b0:483:8f38:a928 with SMTP id
 5b1f17b1804b1-483a55531f0mr6308035e9.34.1771561406223; 
 Thu, 19 Feb 2026 20:23:26 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a4e8d392sm11105865e9.2.2026.02.19.20.23.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 20:23:26 -0800 (PST)
Message-ID: <6997e1be.050a0220.2f0ec0.b216@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 20 Feb 2026 04:23:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771561406; x=1772166206; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=x6QL3/ZthZiPl44FMOlTJT+WefR1/4VrVnmJIuj1B8Y=;
 b=a1ZTFJCbUYHUeJEBaRRdM+pQzhgXJzykPs/VNqA/cd2EHL+MAoFy72nW3+uj3ULbDy
 ZxIm2YuV3EUgoPXZRpS+Dzvv1n2dJfQmPMd1iZJAktIMKI+hW3s90O8fJK6FaCdCE5Cl
 C7ylv1K5zTXmmulX1xrj4J3LWHuaf2sP5z64ncSWVQRqQFJXWWIoU/lrMXNboZJlg9mq
 lU9Zl0J3Jr6m5MSpGzqp7b04YizANaDSkP97Qqhs6QzSkAqw3+qsOY8n/74bQbvsScYY
 A+wOyE5um1T77fsg9c1ISUpe1HXeTvR+89Ooh6MVJNgdgBuZCD4++t+VNhmH/V0YnT7b
 aF3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=a1ZTFJCb
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-19
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

Autobuild statistics for 2026-02-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  4  |  0  |  5  |
  2025.11.x  |  1  |  0  |  0  |  1  |
    master   | 33  | 69  |  1  | 103 |
     next    |  1  |  1  |  0  |  2  |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.42-51-gcbf39c26b258... | 4 
               openscap-1.3.12 | 4 
                   dante-1.4.4 | 3 
              libopenssl-3.6.1 | 3 
flashbench-2e30b1968a661474... | 2 
            gdk-pixbuf-2.42.12 | 2 
  gobject-introspection-1.84.0 | 2 
     libphidget-2.1.9.20190409 | 2 
                 mdevd-0.1.6.5 | 2 
      passt-2025_06_11.0293c6f | 2 
           python-brotli-1.2.0 | 2 
              skalibs-2.14.3.0 | 2 
uclibc-ng-test-132c6134d691... | 2 
uhttpd-15346de8d3ba42200249... | 2 
                       unknown | 2 
             babeltrace2-2.1.2 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
             dahdi-linux-3.3.0 | 1 
                    ficl-4.1.0 | 1 
                      fio-3.41 | 1 
              gcc-final-14.3.0 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
                 host-rust-bin | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                     kbd-2.9.0 | 1 
                    kibi-0.3.1 | 1 
             libgphoto2-2.5.33 | 1 
                   libiio-0.26 | 1 
            libxkbcommon-1.9.2 | 1 
            minizip-zlib-1.3.1 | 1 
                       mrp-1.2 | 1 
                openswan-3.0.0 | 1 
                   perl-5.42.0 | 1 
             picotool-2.2.0-a4 | 1 
python-remi-2022.7.27-37-g1... | 1 
         s6-networking-2.7.0.4 | 1 
                   seatd-0.9.1 | 1 
              shellinabox-2.20 | 1 
                     shim-16.1 | 1 
                  snort-2.9.20 | 1 
           uboot-tools-2025.10 | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.3 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/e3b9c36dc475af2ae35c2e9434ecd3c6313231b7 |     
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/048a79f255a462bf67419b4898488be3919f01dc | ORPH
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/ef5cbafc63604f37159489d3fd801d8c7757aec0 |     
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1d95255f20886055a554ce8b43b241b221783d1b | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/1384cdc0b3f94593787b16e0ebabd88b24de17a4 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b4c58371a3d6ff950340b594ab18bdf07eb903dc | ORPH
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a7b3dd87309ff714e4d24ffa30f6426b2f079b14 | ORPH
    mips     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/3d2c6da2d82055c93fbaa37bc839d155f2906e55 |     
 powerpc64   |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/561868f2c893802a797391e1b01a462de1bef067 |     
    or1k     | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/5f526b5c9703789a5adc59fd3ea981576d3761b0 | ORPH
  aarch64    | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/eecf2cbaafd8a170b5f5c6c24df552280a530204 | ORPH
  powerpc    |        gcc-final-14.3.0        | NOK | https://autobuild.buildroot.org/results/e16c354bfe6dcf0ac5806312885f91d9414a8ca0 |     
   armeb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/c37794819d0e12c1b7a1567d224da9147dade4c1 | ORPH
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4662a52bb187e7a5b3cfe66e4af447a6603d3521 | ORPH
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/cc7058942cbf3086b22530397cd5959a0b2428b8 |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/345f25d988044efe2b39401e78a280be945af929 |     
    arc      | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/66722a84cbc030077f745d8a07358df263e3e461 |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/4e86aa5011a4427529274bc36cb9bf24cee1921c |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0050deeb62bf435ec270562152bd956cee94224b | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3e9929cedb8ce95eef5cec7c3736698fd63507a5 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/d92bfecc87e595bb13ccef6cda1d61345bb416e1 |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/356a77f52de9887b78629181da85e7bbc6f6830f | ORPH
    mips     |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/ac31164b4ab18af972e8732dfdb449a44803032e |     
    sh4      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/f55de734ac1e7a4a020f47bfa0682354b57adc39 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/ff9f5526c2ea8418ba5955e8d2a8b93bad7b4c5e |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/b57f581f677094144ba4fb91797f28a9f665060a |     
 microblaze  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/a1f22a232b949cd9960fd4639e0d40d9b70eea75 | ORPH
  sparc64    |           kibi-0.3.1           | NOK | https://autobuild.buildroot.org/results/be69329faffde2107dff293ac1da8e2282b401d3 |     
   sparc     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/a593eb457c126e3a01b669123854c73fab867302 |     
    arc      |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/87c89271382424db1a80b99af79a914a0eac0ef5 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/dd5e20fb82e2fc1a940b0e31eb7e5c08fa4a57d4 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/7ffca7e69a27c4c1b6a81d6649bd05d748308a03 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/591d1ca39dde1f4cd06ecfb9db2f799d2ecb4fda | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/482aaf3fa2de54b295163ceb8fb096da6fe0b1d1 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/ea756c31e53e70e61ea184c9666c40bd69b1f36b |     
loongarch64  |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/5bae6d9c4a0177689687078f084bd0dc1d7e5423 |     
   mips64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/475a65e1cfaf63e886a33d6ca57a7fdaf176d692 |     
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/6c0d7ab2e653b29385705e99e6556e43f7ff7a52 |     
    m68k     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/dffd6e5160d83883fa0bbfb64aae18bffd1113c7 |     
   mipsel    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/8aead3f949b8aa72c67b923b8d8f4e036e487fa4 |     
    m68k     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/51e3cf416737d7221a30e8a3f02b3548abb45ba9 |     
    or1k     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/76276d0d545f277c91a626a65958f5a3ec68ccf7 |     
 aarch64_be  |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/635732b009e33153a64f642e9177e75897452fc9 |     
 powerpc64   |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/6dbde586c647ffd8a7d95e9b233e07c3946627ff |     
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/dda21ed20bf74b27057141e809f6ef19c38d5c8e | ORPH
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/baf0676d6706286f2deffd4ef248b2d8ef40bca2 | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/bacd3b2baab0f99ad57e7613fa96b951a1b844f9 | ORPH
    i586     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e36b40527bae97b98319d83bc2b259a921a7aa52 |     
   mipsel    |       picotool-2.2.0-a4        | NOK | https://autobuild.buildroot.org/results/a9ccb015803d1f1187df2b695aefcae496f820ae |     
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/b0f48799b1053e3c9a35d3bb075fe08b88e3ce0d |     
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/aded3b3d2d3cd701acb6f65b239a38faaef9c287 |     
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/3a8ce5ec10fc605aaa5df8addcc99f16d9245c44 |     
 microblaze  |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/9459c7285bb2eadbe9a6609f2c5cb34a2f02b834 |     
  riscv32    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/44e626eea4b1d5692cd48336faf64549a02fb560 | ORPH
    arm      |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/f7550d9a8cdaebc53734e14a57c118000084dcef |     
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/ec6b0397273271615ee3919e23ef640084dfe06f |     
 aarch64_be  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/a1dd0ac57fec017dc86c15f52d0a7b7050208e0c |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/4217b4a1b401dfbe5bd4d07d098e3b6d2dccd877 |     
 microblaze  |          snort-2.9.20          | NOK | https://autobuild.buildroot.org/results/3b92d275a32721bd2cbb10e15c392054dfd42c63 |     
    arm      |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/471ea8c04122f8ec801769351aa186dab275a4c9 | ORPH
   s390x     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/0d277725cfaaacb2e6e95f7f50c955197a1a92e5 |     
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/010ca895c5e73c42211637cf440283e2d65bc37d |     
  aarch64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5eb7723a7b09c80139f603c701186109b9f22783 | ORPH
 microblaze  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/76855c6f07e6b813713fe6dc840a65ee8ca646f1 | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/92c8d91f6de7237e7d665dc795497ffed0fcc693 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/ea0907a38c561da1bed139f63b59c08b560e245e |     
powerpc64le  |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/8818e9fe7337d2556d7b4b46079c5dbc6f06aa63 | ORPH
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ecd7533980e1663d91066e69f730c7d63b8015cd | ORPH
    arm      |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/2874dacfd2dc73db263ae1f1333707e38cd711b3 |     
  powerpc    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/8f13b63b5e028cdcb9007a3e4ef0af3cf3128e0f | ORPH


Classification of failures by reason for next
---------------------------------------------

       libpagekite-0.91.251215 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |    libpagekite-0.91.251215     | NOK | https://autobuild.buildroot.org/results/a9a788eadeefc7888625dd467b80de8d00315a04 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   dante-1.4.4 | 1 
                    gcr-3.40.0 | 1 
                 libiconv-1.15 | 1 
            lttng-tools-2.13.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/50e343e1d66e8a4aec553c123c693f777fee0b85 | ORPH
    or1k     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/c81e406268b2a8fe03003d2fee25cb849e63a5cd | ORPH
   sparc     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/31e05972b09d98840fc349544959ff819c39d127 | ORPH
  sparc64    |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/9d1995330b92510d5e956cce6b417d32f560b616 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B98CE63C85
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 04:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B689782322;
	Sun, 25 Jan 2026 04:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdkcWXTMUh-D; Sun, 25 Jan 2026 04:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AC2682315
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769314960;
	bh=vIeHmstb39rNLNXmvqKo7gmpWOegIi+e8WyXu2uxf2c=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QfRnhF3y+0kbg2gm4dbF0PqZIM1CzotvXVJH+6YbK1SAVQWGAWuAJsFk2E9DsbcPb
	 U8nFiXyePsRFHiJbBekIm5ltaaa4d33mUQGn69LtWmrtVQimuRSj140OmFm6av3SBP
	 50NxiP85mB8+VwKXfE+aAJrZVZcZR64A2yAyw3z2WG66z5glblSNWSBWRf0zXwGRuN
	 o3LbOArPoUWg9RDHS3jOTry0acsbV4/TRMfh/UuDHADuUyUHqNJBBNt+DC0yUVkIvJ
	 K+GvPxIEYBP2mqCLFysIld2kxnaoMzDlvqSmBhpWDxKdnAy+xSe25b55/DSy4A50xA
	 qn16oj6PYk07g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC2682315;
	Sun, 25 Jan 2026 04:22:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D48E122
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 04:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08D61608D1
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 04:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysjiHeQruoqb for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 04:22:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75AEF6085D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75AEF6085D
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75AEF6085D
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 04:22:36 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48049955f7fso28124815e9.0
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 20:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769314954; x=1769919754;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IFTUp9ZlY/cczoKmHvOJMW1lDaNsAKLV8QYmw94nl6M=;
 b=AtZAnxxWmgAxkyU2aJSFihHzYhXomsjSk4vxLfyWfGI24ufrXwee8TsuDNnDwXDStL
 LU7G9tCpR14/ttmiOszo3keSpp+bJhrjCGyU+EBig7gkdHStRS23Y6AJ0aSuMiUbtILX
 xpCmM0mKoWN0qB2wWA1LKDJQ83wE6z9hVeajfmiI1ki5qYSL6hfKj8WsZl1ifQQgec4t
 HFfETFVviYTQBiW7kOJtujsC1nlhz4rKTzblMUqNxNMoeI76LhZ+WkTIsO5BrE8MwhE7
 aBoZq7cFfiF6n4vxaX27UI3WEh0W+0oDJ8joKt6qJP2ngKaZKD5kTXIOg50L7KnufJoX
 0XSw==
X-Gm-Message-State: AOJu0YyIo5F/vb6bdt7r6WqPopt5aB+IH2H72nO7pGkcYM459Oj4t5XB
 Pq6hTj1TGEYOICrT7gFKzSemKSscFssoDwlZwOUKlcGvCj2pM3flnjvbc2WrTw==
X-Gm-Gg: AZuq6aK/p1ZBG5A0BsPTft5/mkx+fV500s6mKnyvUgA4zt9cPh1SjgAflnzYkrYqVgw
 WPu7iiQE27QzPXm7thrCa0a0jb8DDqoGpODtKPNuuZCpIKszrcpNzLHM/FSCgp5aBqfB7199dR8
 2C3GAWhrFyRxqV9PQuhMe/nBpqGb96eTK9Y7+VC9HiEVFX1oiNxjv2s/aJQFmMMlYImNhaLxiHy
 vE42kLwha0n1ykfN/G1sjoxuioGd8e108oikwQDtfzN5++khuiQnfRLq3/nqi/Lelkt+OXJP+Sv
 2bIlygnHszTQAkqbkJMv4MjiESD8bWv269Z0oBOIomoHJYwqR4zByFf37Jma4q+WSOjdf4vYSez
 E8VQLB1/M6VIwjsixeUtAQWkw6cXkBjSjnJE6owYCQBmHMdvAqidkLIH9s4pNBGHi+t8OCAvsIj
 YFMBbvwv64V/UEujKGpQ==
X-Received: by 2002:a05:600c:3b0d:b0:480:3a71:92b2 with SMTP id
 5b1f17b1804b1-4805cf66b1fmr7935175e9.26.1769314954093; 
 Sat, 24 Jan 2026 20:22:34 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470474cbsm250391225e9.8.2026.01.24.20.22.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 20:22:33 -0800 (PST)
Message-ID: <69759a89.050a0220.2442b5.9b74@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 25 Jan 2026 04:22:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769314954; x=1769919754; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IFTUp9ZlY/cczoKmHvOJMW1lDaNsAKLV8QYmw94nl6M=;
 b=OGY60gHi4VdDnur+s19nzj2btq74ifGBzE3MFHl4af0eabR8js85yvlpoSs0RVNKxt
 d/7CbI2uQ+FHI8sK4wHtr+MJWvSn5kSx9Dr/Jeug+q9u71jRw0Z+Ne0VOZXEgdYMBqka
 ou50Vz1Ur2bTEbWH6OfqHDaw1d4FzLGKuaFYaHmf908MauIscBPLVrLiSZ9jZujlTz4X
 5zqnnH2eTgC9fiVCtf4tapseEnqzqrVIfYbp7mL3vCYJ4Dq/aQ568nhy2B808iiJCXgW
 h7q54VxKoE9MG6JyUcRr3JmolFxEgfu9p8aSrd0PngHsjZX8vbXcx5sziVX7YXLPDxat
 oiZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OGY60gHi
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-24
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

Autobuild statistics for 2026-01-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  8  |  0  |  9  |
  2025.11.x  |  3  |  6  |  0  |  9  |
    master   | 34  | 59  |  0  | 93  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
                 jasper-2.0.33 | 4 
                    mpir-3.0.0 | 4 
                   dash-0.5.13 | 3 
azmq-v1.0.3-54-g819b24035cf... | 2 
                 c-icap-0.5.10 | 2 
              libopenssl-3.6.0 | 2 
     libphidget-2.1.9.20190409 | 2 
          linux-5.10.246-cip66 | 2 
        ltp-testsuite-20250930 | 2 
                netdata-1.37.1 | 2 
              shellinabox-2.20 | 2 
ustream-ssl-5a81c108d20e247... | 2 
amazon-ecr-credential-helpe... | 1 
               asterisk-22.5.2 | 1 
                   atop-2.12.1 | 1 
             batman-adv-2025.4 | 1 
                  broot-1.54.0 | 1 
                   ccrypt-1.11 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
              e2fsprogs-1.47.3 | 1 
  gobject-introspection-1.84.0 | 1 
              host-grpc-1.66.1 | 1 
            host-mfgtools-0.02 | 1 
                 lcdproc-0.5.9 | 1 
                 libbsd-0.12.2 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                    libev-4.33 | 1 
             libgphoto2-2.5.33 | 1 
                libressl-3.9.2 | 1 
                  libsepol-3.9 | 1 
           libzenoh-pico-1.2.1 | 1 
                       mrp-1.2 | 1 
                openobex-1.7.2 | 1 
      passt-2025_06_11.0293c6f | 1 
uhttpd-15346de8d3ba42200249... | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/4f7da89f4633119fb4724d17ec9dc241a2ea4ad9 | ORPH
 aarch64_be  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/43e5e91406be96828376087d79eb9512a370acbf |     
   sparc     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/b3b71c7e435a80f07e30163ebf708572951d3d26 |     
 aarch64_be  | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/873e8638dbc2c548613911cde04fa45a3b8bae29 |     
powerpc64le  | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/e69dd59e6cce832fac9537d1fd1ff754bbe4b2d3 |     
    arc      |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/692678b00f7b22281acdd48731093ea9edf81573 |     
   s390x     |          broot-1.54.0          | NOK | https://autobuild.buildroot.org/results/0527e9ba4a1e24023ecce3d5316d20e0cd1169ad |     
 aarch64_be  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/7f5e932785d1ef1bd4d2f54945d7e6f2fa9b31b3 | ORPH
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/26962f00e60ed0c7997ba09318c29651feabf2bc | ORPH
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/5063a127934ec0a60225fa436197449b1abf30a7 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9ed2aa82936c610b8181963d84008c20871962cb | ORPH
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f9b610f2dfa090c19d5e636ead6de9fbc07b03a9 | ORPH
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/47ab9d8281cf48f1c2466acf8917039877a09c00 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/b77d3c8af6163f9d7ee57a0bc36e3dd34caf386d |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/1fd7627623ed10492c55dcd9aa16a47efbc38e2c |     
   s390x     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/7ddfaad027482152a2f90a687a663cbc2a7db1a1 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3e831aec3645bb871463d25986d5aaeec221f853 | ORPH
  aarch64    |        host-grpc-1.66.1        | NOK | https://autobuild.buildroot.org/results/84764134062f28f86ecb1646a536ee4862e4f8df |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/dd3b595d91cdb11f847a2db4118292312e0c81c9 |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/0f732e413c0bd24512e760e792c074e99c15e4eb |     
 powerpc64   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/e052250bf75bb8316fe0c1cf67f93a57698d8958 |     
  riscv32    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/8b101ce7f2a6885adecc8cbd096b8bc9d20d4863 |     
powerpc64le  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/6d07129b04a21d0c2950ee1c8c26bd29d67054bf |     
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/77cd6013fe1aa933120bc8dec2752384065886f7 | ORPH
   x86_64    |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/5e2094638d24f4dc208f33070e467e7c36258e63 | ORPH
    or1k     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/a7d2204ffe210c73afd48eb262c733eedef6fc01 | ORPH
    mips     |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/589e053e5098d7dcacb9bfee869c6364e4640342 | ORPH
   mipsel    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/b77add74326e507ab53459866084a8a9eea614d0 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/3a78a91ba5ca6c76d904a74a28a5b5b5deaa629e | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/3def176ae60f29ac9423160fe1cacfc64e0ee630 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/07b85d4a9941fc01b18c83a292a07a0f36f11e7d |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e3165d2a19190cb8d76ee10c0e84f3a04eb1c627 |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/23892cd1ba34aefe3f86466f71cc810c67510265 | ORPH
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/84739254cc1245e46f21b7097234b181a63af997 |     
 aarch64_be  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/b5d3f7416975288263e6b3b28478ecb834bf4ed2 |     
 powerpc64   |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/bb3ce3a8ff60d7a7ce76997e67cf872ee8e61c15 | ORPH
    m68k     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/0adcc8afa46d50ed9845c7be16e85376a25aec5e | ORPH
 powerpc64   |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/1205b89d6ba68aded785c74b2007d8ca53fc79ac |     
    arc      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/1f66873a066ae1849ea77852b67d39beb9396ef5 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4671a7de3d54fc2e470860373cc92f3f92bc2a7c |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c9d945e4e56eca6feae7a7f2b00be4b558172a1c |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0bb8c23f32655331446e71d41e7a064be8daf449 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1dd0273a95fe1f6ae987c1c3e1531b68a4e2bbae |     
   s390x     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/0e5351f83db2d70db3d28421d908d9b5812d1b99 |     
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/638f58fb7d7816745968105d4db74bb0b19166ab |     
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/7084a73d5727a86ca55eda3d1f01ea4d5b8ecf65 |     
   s390x     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/0517382ab6760a6568d821dcf1420c999ff4eaae | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/3ec727768d88a41a15a0dc2ce5bdb8818af005c0 | ORPH
    or1k     |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/6131fd012943d159665cacb07a94734edc0cedda |     
    mips     |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/c281e55ab6373da96511481fad664dbb8ac3af42 |     
 powerpc64   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/1686feab3700ee46bd3d24bed37ee1594b9483fc | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/0728bb2cb624c7a3d6b75147da929bba3b75d040 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9eda4e93b7ae761d51cc4b473269d57036be2cec |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/381d75baa25ca41cfea777022dde8bd091e62440 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/72e4e81763d5f7ea47c26138ce52a0a5ed0fd4c3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f303d83a8ebac6e008d03e6e5fccccced509469a |     
   s390x     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/d54b86c7372d680a87ea5c5483fa3b4d57365fec | ORPH
    or1k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/63ab4e2743a6065a36061db0dcc905234884c279 | ORPH
    mips     |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/9fedb723ca36f292aea44537ae1e3b554ce4561e |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   atop-2.12.1 | 1 
                   cvs-1.12.13 | 1 
              host-rust-1.88.0 | 1 
                libgeos-3.14.0 | 1 
               libglib2-2.86.1 | 1 
               syslog-ng-4.8.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/1ab61e0521ab05af70ced4c64d5806887c4dec7f |     
    i586     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1261f83df4e97df8036bbb5fc3872f113aa87ddf |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/1cb4d00a679834a9cb59c5c206f1729bfe074970 |     
    or1k     |         libgeos-3.14.0         | NOK | https://autobuild.buildroot.org/results/d7fd319ccd5887fcbf4ae3fd2bfdba9cc2221843 |     
    m68k     |        libglib2-2.86.1         | NOK | https://autobuild.buildroot.org/results/a25c2896ef1b166698cff355aa0ea96fc6ba4e67 |     
microblazeel |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/70ca3364da15383a8270d180cd2bf67977d9cb56 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 4 
           host-libselinux-3.7 | 3 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/302e430062d8cff9d88fcc0a46308c60d2c3d424 |     
   mips64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/f7a7c83b3070e79941810b0d06e383da93aeaa17 |     
 microblaze  |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/9405638d713a87021c0fb6daed3d1ffbdbd8f27a |     
   mips64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/a059a5797b5f255cb9181dcce13cdcd2086a35f7 |     
   armeb     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/531d188a1629e7d7f48829950ed26d245e732abe |     
   s390x     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/7d55f18d7a6f32866bdfac2ab66e3d92d691de6a |     
   sh4aeb    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/d6e1e585794f6cc96c0856195017d2d163dce165 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/fe529a277224c2822832ef344b4a4f3271e2e659 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

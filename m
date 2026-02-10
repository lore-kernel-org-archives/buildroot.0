Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DBDEA3F0C
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 05:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0E9140CD0;
	Tue, 10 Feb 2026 05:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fv9xQ6p6jGdR; Tue, 10 Feb 2026 05:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8876440D06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770703140;
	bh=aRayy+0MXUPa6VzKyd1BHvzrFUKBL6iykrS19b+Dvpk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JMHs8OmTp9qeTZHeSi/CNLJrVeLfq2mq3kD68XWbqpVca/2xociSxOAx7josb82Yf
	 ehpVmcxgXcX4QTO52ddp4KTQpnIIUV5RXn0CU5pVGBQbUP3hIhEd0NGts8PWyeLY07
	 CmYsRrcYBGsGTz4XFdJTmwqvFjeXNdYtgbgyU/2yzXak8YcXwSxUh+P9NzL/NSudk9
	 Wx5VTBTMn/+Yd+38mCAoopn1TIT6Zb+Tg6eMU3aBT/+3EQ+TbRPZr4Z/5dPeXzm85d
	 66mOfW2p2krtxbt/xvy5OUdTbnDb7+cab9K+aoWuZJAdXoC/IGeFwsjB/ZqAswxRoC
	 m7YmM6m/gMEBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8876440D06;
	Tue, 10 Feb 2026 05:59:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 371F41A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 05:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 274D560FCF
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 05:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDm3c4Nb4ITT for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 05:58:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6CE060AC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CE060AC3
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6CE060AC3
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 05:58:56 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6594382a264so6922276a12.1
 for <buildroot@buildroot.org>; Mon, 09 Feb 2026 21:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770703134; x=1771307934;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H9NrZUmnzZqkFEwAdyyG8ntSNtekbUHZdbGiHwCxG+k=;
 b=P8chf/+vZMRKcfUlYdG/uSJ+0SX02PJqBU0tIyDkZaMQF5R67e+V9jhZ6M0sE1Jlmc
 ykEfSejUDNLTpBeZ/9CQAh3OT27Hu4jysG+k04iAfeEqz4Ou5mqxgZyvQ7aY/NjtNjFE
 9aUG02KG9kJ8ItdmgEUJohEK6D8Lcy9DcZvenJf7dBJKvspW+mouO450AkM+S28JTSIx
 2TVbjy4X+qCtWRptxanrf7lBYcQLnOFzwXX8jO8kSUqBTLDZtzr+Kb22f0k7EhdojPZ7
 vw51wtekD2KTnRXXCuGGz3+NY5097L6CCZHH6lqw3UPJz5Ca+7+KLPz4KwrRz62H+feM
 FdJg==
X-Gm-Message-State: AOJu0YwEUayD6rgd2WLU39nYgbYI0Vxawwva6zZLtPeRs/OqzpxhPPdL
 VmMniWuavrDsc39P9bRONba4D6gsIKoeS0B9C1PhqBgb4Hyr+Jf6PnGimTlqTw==
X-Gm-Gg: AZuq6aLFpk39YeWbpp3/oKCfd9JSeU0Bv7tlfC5xyk2zV+Tj0TZ31mJ6Ieee1yTzV/I
 gXkwzoiclvwIsxwYdCPnhEHGg8YyPP4KEofcLrSkg5EgXd+w1yQsTBkEY3dADbHwtmA4XjQZRJs
 4lYATM5oDuSxvuiY355TADOw0Vdh6346e7YDOCneT0ZmG9+riYoryP0J77AE+XMYAFLEzIVSIiO
 g2QsWRW5YCChDZL9T22rbvJVR8pCtwt4rqR0f8Rn4KwRMnZedqh2b7/9DbifkDf9G+QOcOggMUW
 2dvSy4FebIctkmsKe71Gvf46HBH/jTD2YRwqQO/qy2ONmhcMBPzS5wmTAXh3qiVOWja6c3mFTSf
 4JBYuQCve+CU+6xc/Lb+m0Zq8aRh9W8nWuOa5mp7SBL8yXUa05GNXtyWADkX75OlvmP2OanzXlo
 QCkHoLrUlJ0VeBwhan4dC/YQ6kZbsjrQ==
X-Received: by 2002:a05:600c:524a:b0:47a:94fc:d057 with SMTP id
 5b1f17b1804b1-483201da912mr173757135e9.2.1770697239121; 
 Mon, 09 Feb 2026 20:20:39 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d82a4c4sm55698545e9.10.2026.02.09.20.20.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 20:20:38 -0800 (PST)
Message-ID: <698ab216.050a0220.29060d.6610@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 10 Feb 2026 04:20:38 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770703134; x=1771307934; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=H9NrZUmnzZqkFEwAdyyG8ntSNtekbUHZdbGiHwCxG+k=;
 b=lOlmsULP5HPpU7uXdQ+OfIPR+ERCf8FBG1PB+0Cct++F/LPzugGToreHYmHtKMasWS
 2ruCLV/VRjHajdtj6G9a1rJ1CrH5AlQgBGXUNVcJoMlPs1ISEKpPmPnaFOKB4YpItMjj
 qXtDdSaznCNQQJ9kni8Tnl4PxQ2gBCxcBIuYZHu/b8tO2+3+fmRMvV+4UGbhpGnG8deX
 BDVvTQ78T6VEno3+lIyZwnbHu0p9Pq+F51ujLgW8cfyvOsQU2IGLT71CvX3nH6/9hhR7
 rdDUCBYmZiyaLU/nz6P+5EG2+cJblHON3yxkZDG0BiuDcvQqSbg7NhwO1JuWL23t2MG6
 9DzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lOlmsULP
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-09
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

Autobuild statistics for 2026-02-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  |  7  |  0  | 14  |
  2025.11.x  |  1  |  3  |  0  |  4  |
    master   | 40  | 56  |  3  | 99  |

Classification of failures by reason for master
-----------------------------------------------

     libphidget-2.1.9.20190409 | 4 
                       unknown | 3 
                 c-icap-0.5.10 | 2 
  gobject-introspection-1.84.0 | 2 
host-am335x-pru-package-5f3... | 2 
                  jasper-4.2.8 | 2 
                  linux-6.18.9 | 2 
                openswan-3.0.0 | 2 
                 avocado-113.0 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2025.8.1 | 1 
              fftw-quad-3.3.10 | 1 
                    ficl-4.1.0 | 1 
                 fwupd-efi-1.7 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                        gnutls | 1 
                 host-rust-bin | 1 
            igd2-for-linux-2.2 | 1 
                jemalloc-5.3.0 | 1 
                  libbpf-1.6.2 | 1 
libdill-32d0e8b733416208e04... | 1 
               libglib2-2.86.2 | 1 
             libgphoto2-2.5.33 | 1 
              libopenssl-3.6.1 | 1 
             libstrophe-0.14.0 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.23.0 | 1 
                linux-firmware | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250930 | 1 
                    make-4.4.1 | 1 
                     mdadm-4.3 | 1 
                memtest86-7.20 | 1 
                    mpir-3.0.0 | 1 
                openocd-0.12.0 | 1 
                openssh-10.2p1 | 1 
            optee-client-4.9.0 | 1 
               pulseaudio-17.0 | 1 
                   rauc-1.15.1 | 1 
                 rtptools-1.22 | 1 
                  sdl2-2.32.10 | 1 
       sp-oops-extract-0.0.7-1 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2025.10 | 1 
uclibc-ng-test-132c6134d691... | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         avocado-113.0          | NOK | https://autobuild.buildroot.org/results/692d6de2406ca865e54275252bfe8c41948ce319 | ORPH
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/31b5c592242f64d017bf5cbc291cc377204e8e59 | ORPH
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/1474f3914c3751802cbef2cb910e76f60a0339f3 | ORPH
   x86_64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/cf67da85a5e8119f426eb5ac3be44e0f5d460df9 | ORPH
powerpc64le  |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/85fc574621c6a064e6f77177f1f8f6dff88d3013 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/ce9f9f5cc8c1886e572814dc447d025c19aafbda | ORPH
   armeb     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/985d675c2f8b7dc614f2e513a1951ef0fcdfa139 |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/62cc416c6b26dc0b8fae6e79e1b3a5e6338cec17 |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/52834f81e284c7ce86056ff02a00525b3805bf14 |     
    hppa     |             gnutls             | TIM | https://autobuild.buildroot.org/results/f2f7d5e9a475bf8e03b50940631348a139d97907 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/488c03bc183e32771b4823648892f448a715216b | ORPH
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/899d3c1c9a589e34c839f32e23bf47c067d07fc2 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/0079952783447b2ac9a344c3f59865d4dfe569cb |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ef05f4396cef352293393f12b131fa77ea5e074d |     
powerpc64le  |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/0376497f6a040becdbdf569eaa8016ea890c0218 |     
   sh4eb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/4abb706f35ccd60184216c7225e62a9264fb90d1 |     
   xtensa    |          jasper-4.2.8          | NOK | https://autobuild.buildroot.org/results/afc06378ba4a1bcc2ef537efdad447a679082130 |     
   xtensa    |          jasper-4.2.8          | NOK | https://autobuild.buildroot.org/results/849057bd08e045ff539bb58e4a0aac8f8e7269d2 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/b915c3c485388a7fb380d761f3ea0c9ee419dbad |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/ea048a396641000cac6de456c7e698541fd0e357 |     
   mipsel    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/5527ed1c1a3956965e50d56b20695b7b730d39cf |     
   mipsel    |        libglib2-2.86.2         | NOK | https://autobuild.buildroot.org/results/4f3c2130fca0a23575e39050d90977102fd4e82d |     
   armeb     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/182be6061e53b95c2a6a6db0adbb8c103f9efa1c |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/29c6d67f347a3b592d3fafd8b00cb5c5900abfd7 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d48431b9b51e28c7c32699b6de85ef3070cffc09 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2ab52ab02a0ab071de6943e93b2b13080d30a3fc |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b77efffd4d16d8806cd9c62a1ed8897cf2e72700 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4c3187ac229a31a6cc23a906504ec141a5359d8b |     
  mips64el   |       libstrophe-0.14.0        | NOK | https://autobuild.buildroot.org/results/969a59f8bd8637e6bdc66fa1aa5d2f28d440e62b |     
    or1k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/678c741b5a3a34aae8541ff8e1d560383e475ebb | ORPH
  aarch64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/6f73a38cb36eef98ce7098f33db2613808d69743 |     
    arm      |          linux-6.18.9          | NOK | https://autobuild.buildroot.org/results/1f1521d98861ace2aa11bc150af4a86f04c7edd4 | ORPH
    sh4a     |          linux-6.18.9          | NOK | https://autobuild.buildroot.org/results/72e00d293f4b2c135d67573c9e5fbd661306dda7 | ORPH
   x86_64    |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/1019fffe0bd7eae00ed71fb5da5fe113f6930390 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b0b6e2e737007f89cdb68df4e0ddc9d8a40a8b83 | ORPH
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c9befc434021d9893e3ac6ad65d16b5078e7943a | ORPH
    hppa     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/9c05ae9edb5d322554e6005f453cc1cafe70ae91 |     
  powerpc    |           make-4.4.1           | NOK | https://autobuild.buildroot.org/results/e9250f1bdbbd7c65a8bd108f32ad9eef73a3eacf | ORPH
   s390x     |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/7c6dbdbadc58b7385ed8de7081644ebf52575b98 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/336c9ce65cec2cac753c501ac9b2e38ea68e5e32 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0376f58ab879bf1ee10f2c62af1ea1c8f2f41c3f |     
   mipsel    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/02f346a72c9e47c5e3afe306f9a22aef7be7590a | ORPH
    mips     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/d745f364046b044d33fe56fb53fd853313670f99 | ORPH
  powerpc    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/5751c0defcf22fa791a6fc83df3a4ac86e33c98b | ORPH
   mips64    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/79337107079cc5f4fbb57158b64b65136b327c6d | ORPH
   mips64    |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/a48561b2c709d688c2ae764cee6607dd651b8ba6 |     
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/56af5d2c16b187181314c2213520554c1ddf63f0 | ORPH
    mips     |          rauc-1.15.1           | NOK | https://autobuild.buildroot.org/results/4455152d67228f437f8c1f0024002b62d306ef72 |     
  powerpc    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/3b2fb75cb63f43d8183539e836b233bcae31cae4 | ORPH
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/2b9764421caabaa1476c45b1f033ebcfff4876af |     
loongarch64  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/f7d93c3549696181ed144759739e8929554444c6 |     
powerpc64le  |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/6d58805a4275098e05aea729acaa43f04401ac6e |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c65509e185e269ab93ac6ce36dd2781b3bbedde6 |     
   x86_64    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/430acc1eb5e973033b8a941a1e50c75720944721 | ORPH
   s390x     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/fa7f562153cf5511228bc604b63d29b931352f5a |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/77d6b489f461794a03f03b0456bbc7b9e96bd415 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ec1c1e7265649f6cf9be36337125f81a34ebe881 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/58b35197d95eeb35157f78f527626c09cbed6f7c |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/0fff1f7e1cfcfd2dc5faaf06a84695fb5e1881b6 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

               collectd-5.12.0 | 1 
                 coreutils-9.8 | 1 
             libgphoto2-2.5.33 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/3e295f58b2828c6f65d468f01ba77852443949c8 | ORPH
    sh4      |         coreutils-9.8          | NOK | https://autobuild.buildroot.org/results/9b0eb27213a9f529af29fca5b55dcdc3182702a3 | ORPH
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/142a8f98bcc2097915435de89764ea61fae40f00 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
               asterisk-22.5.2 | 1 
           host-libselinux-3.7 | 1 
                libselinux-3.7 | 1 
        ltp-testsuite-20250130 | 1 
           oath-toolkit-2.6.12 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/561eb131157d002f76e247cbd1c7db19bca2c891 |     
powerpc64le  |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/6111196fbe797d8f843d180f18ec6acb690d06f8 |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/871bfc62298b756571ed7f078aac7601c8c65be9 |     
   s390x     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/8faf1e7d2601194d6c7b9754bd5d7a32ac780a03 |     
powerpc64le  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/4c4cca5edf663aa4c8c46c758ddec7450fe746eb |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f04d1fdd2c39620b56862ebd0eb013296942b4bd |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/5f9760c431a610507ea2c918df671f5e3b2abcc5 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

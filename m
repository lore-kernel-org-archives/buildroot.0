Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FC4C4451C
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 03:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 510B9405A1;
	Sun, 19 Jul 2026 03:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXtMIVJ2lqDY; Sun, 19 Jul 2026 03:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EEDD405A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784431559;
	bh=H2BCv3q58G73bzJG3h63ssaNFqqgeIlaOM90pPhdeNg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NV9PL/hymey96xV/WbdkGLlOaJV81n3D7uE/Q5zAhOQ2Nc5j3JTwMr6ak9+ybVc2i
	 AtR/k3OpT/bryK6kUgEg8OJMfnMdIDVIscBoup6yJ/9T10ef9sx/97VV1kCAC73HtK
	 bV7tdG4O54ZaANud85efZb556bPlN3I6NXZ2cL1BAgzCSeKhmAs6ja8mtQVA2+d2F+
	 Mxpw+wTTpUPdN31Lp7cwrLx5v66NTA8H/iyOu5REG32yHcuX2QV3H9zIZSDJWJ4m9S
	 05T8kN/HHz1K+CjatelFNmMJe/ZCAuxHNF/JhYen+SgS38AtwLhnY8ZevCCRAPE/Kw
	 LDMZhRpjfEjUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EEDD405A2;
	Sun, 19 Jul 2026 03:25:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BAC0206
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 03:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8122D80C77
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 03:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2rSWSfCAlBS for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 03:25:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0EB680C71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0EB680C71
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0EB680C71
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 03:25:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47f7027ca11so241185f8f.3
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 20:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784431553; x=1785036353;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=iN++limtz5ASHpecnsRF7Uh6DOm2TvrjAyAc7OBux9E=;
 b=qSqiD6TDiVPov7LywdC0k0G2UFwLbVj5Pr4uyXppnTT6XdRGbjqVPaAfTA4/utd4Jg
 OwUiYA5tNxEdzkJ9mktLxnx5VsLPOGP37zzUwapm+ZzdQX0j8oF8CjsI8bGLoC/f6ooA
 2/cBEmdfLmipHKO0dG2zUP7Qo64nN9cGB3j41jJXIJObYToj79eOH5xCLp6COansF9Lt
 KyfUeiDWIBkEorhNfgJ2rfP+v5NOXSHqA1sEadN/Drl1X4zR0+OTaMR3zMeJz+KId7Qs
 YUWL/OdqVVkOq9wn5I7Cr1gdINAOIm66ybHsB6WHAiP5xw+oTm0axo8SzSgWMWio2evc
 Gsrg==
X-Gm-Message-State: AOJu0YyFnFNOuX1DeunjYU33F8hYHvLU68gzl7KeA8a+6oEn8lMLO716
 55O/otZQ9Rr+iamLfqgycSv+Dpit/DKSJ2gbncJkBy9AO1vSFHbtzBt55JUN5BwA
X-Gm-Gg: AfdE7ckldov9FvaNId593xgLbP15fj+3yTUrmcRYJ91ppCryVcek/oUR+cogf7meyTU
 e8a1LE0d1aYkc0vjAJETk7HeazG43OQlCudzqgVjir3Ifsk3UIU0QvVQfa7QakFjd2sG0iJE1Vq
 kJsVDCoP4IwGN6X8hOKd6y2SRk0USjbz0wjJ3oWp0OK+t7wqzmNOqdYACzQ/jhWDiQOpt80uQ8t
 ShDKfxiKFj/oc1CFJqsKXVWYIT4VSy1hP/E39UIuI/fSnzL+7aQsF0ui78mj/Jyx57LWrHGtxq1
 HkRe87J98O0YzHw8HLgzjR+RW7Jx0lhWA4K7Omw1qVCHl6jZ8jOiSqzahhj5ZidKGuM+bLTy0Bu
 GmevRhNRsTDpvunPGkPHw3sOv+2Dkm6Nz9QihkhsNfZSIxtPt5uAAPlcDkhX2w6bDlEKEFjLX6B
 dXPp95
X-Received: by 2002:a05:6000:178c:b0:47f:71dc:d848 with SMTP id
 ffacd0b85a97d-47f71dcd8d9mr1083516f8f.12.1784431553379; 
 Sat, 18 Jul 2026 20:25:53 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edda9bsm17768290f8f.31.2026.07.18.20.25.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2026 20:25:52 -0700 (PDT)
Message-ID: <6a5c43c0.9325fd96.191db.0dc1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 19 Jul 2026 03:25:52 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784431553; x=1785036353; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iN++limtz5ASHpecnsRF7Uh6DOm2TvrjAyAc7OBux9E=;
 b=oP3wl4zNYAI5EigRaO16zU60Mefn8qbYBAPHLv5Q8K1soAetDWSesLlBm4lUojV5HH
 JeL4CTZ1AM3gKOeJGRCH/uXsHEo/7zUyTCcrcAifzEKdo3U8J3xwUn8X6GI1iJrOQrHc
 nNwog4q5uJVL1TSWiDKnWZQzvbqJmsZU9I9KTmuHxcdL6snVLHN5mzZXFFdZ7Vt/TJez
 zibKWSaVwyiOi6AWqYgsWpEjtPbyxVeEq5dCaNDlM2OOdjAfEQYfRxIRZPa6H5bxP6J6
 XGVYlexZaqkLzFRNPe20pRHRIwCYBh5L0hYA1yYm3lJ1YoWjmerIsyUiOqclQM1jlUgX
 dW/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=oP3wl4zN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-18
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

Autobuild statistics for 2026-07-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  5  |  0  |  7  |
  2026.02.x  |  1  |  2  |  0  |  3  |
    master   | 24  | 65  |  0  | 89  |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 6 
              host-pahole-1.31 | 4 
               host-dracut-111 | 3 
                   dante-1.4.4 | 2 
        edk2-edk2-stable202602 | 2 
            gdk-pixbuf-2.42.12 | 2 
  gobject-introspection-1.84.0 | 2 
               linux-pam-1.7.2 | 2 
               tipidee-0.0.5.1 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                       unknown | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                    ccid-1.5.2 | 1 
                   ccrypt-1.11 | 1 
                    emlog-0.70 | 1 
                   exim-4.99.4 | 1 
                  ffmpeg-6.1.5 | 1 
glibc-2.43-45-gdae425b55420... | 1 
                    grub2-2.14 | 1 
               host-attr-2.6.0 | 1 
            host-binutils-2.44 | 1 
       host-gcc-initial-16.1.0 | 1 
host-google-breakpad-f49c2f... | 1 
           host-p11-kit-0.26.2 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
      libabseil-cpp-20260107.1 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libglvnd-1.7.0 | 1 
                libmpeg2-0.5.1 | 1 
     linux-5.10.254-cip72-rt32 | 1 
          lua-lunix-20220331-1 | 1 
                 mdevd-0.1.6.5 | 1 
                  ntp-4.2.8p18 | 1 
                    olsr-0.9.8 | 1 
                openntpd-6.8p1 | 1 
                openssh-10.4p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.42.2 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                 rtl_433-25.02 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                  stunnel-5.78 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
               tcpreplay-4.5.2 | 1 
             util-linux-2.41.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/aca62d48255d76b23d0af4f0e2f2a4c29976d80c | ORPH
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/377a131fa789e6605e5dbdae9654ae715e7f1786 | ORPH
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/9188a010ce33e9a6684a8b9a5642945bd5d05030 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2f9a01a0a003ca43ae22ea8d0cef10b8fa9dd554 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/946931197d1e49c75cdbbe70f32bb9733ea4840f | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/15a73c6d3a4c65b83b67945b4f95f2698ae901d4 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/196a096a1505c3f00a2ff7d7205fdbb65c7eec76 |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/733a3878d280e210fe8f0d2ff0746b04ed751320 |     
   armeb     |          exim-4.99.4           | NOK | https://autobuild.buildroot.org/results/720bfa00ca926a398e901366e7ab20d08cfa9a81 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/2dd5f762d3df5de022bed8361c4fbaf14d747e84 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b7b7e4849891ca714dd49334d701f5e2ab32a8b3 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3cd98d1f6e61195e7edea230196832c47f5a1758 | ORPH
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/5d5c7f4700ff14225155b59303e52b52fb2123e6 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1cde2d88404cc7689bbd1c708b8012dd390b8cf4 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a366b4a76a37b1509a0faa524b0970021c94a2b5 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/dac5faf800317313711f87a8427fb5f45e6ec1b0 |     
    arm      |        host-attr-2.6.0         | NOK | https://autobuild.buildroot.org/results/00e8525926cb1953ab7075c4d2bca864c96c6e1e |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/894a64304742339e3f8dcd9a954440d529474606 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/e5100f5e5b3fa00d1cb857842654fe4ed4f3f2a2 |     
  riscv64    |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/b5b22914653141e9c4aae9bbca0d32060b719a8d |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/72727ee570236c7fb978970e8db6b2ce838176f5 |     
   x86_64    |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/2e971e971557dd1aa9f4fbdf2350a412e4441326 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7e29bae3a56363e8acff43f17f083d98c4f10626 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4ad2926a139fee21860c0caa0b2d2989e0ddc665 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b22ef9e2ca5c288510f4a419bf8d550d2e08456f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e7566229e33154506ff910f2fdadfc5129cff348 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d457f593435d6dd12f3d463b4b9d953c083947ab | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/08693c5058853b3c7d987775afcb7585fa529ac4 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/c880966f9495118640be6e2d285b2870563ae399 |     
loongarch64  |      host-p11-kit-0.26.2       | NOK | https://autobuild.buildroot.org/results/d3c5d21dd8b41471811e03750a0c13cbee706434 | ORPH
    i586     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/ac29615e26b78df02296b2aaef8525bea40b8d0f |     
  riscv64    |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/c8f6ec21b4a23872ab1b8addded899f7ad52f48f |     
    i586     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/8bd5cbfe8828df3ff4898461578e9bdd6f5f9103 |     
   sparc     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/3542c34881848e4ca241741e2301662130ba0376 |     
   x86_64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1e2f2534fbd849fede5e0ff5bf0810da16ddf821 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/4d46d80f482727f32d2cc795723ad920f8804c99 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/08114658e9a9ff14de695258d23139d2bdbbe744 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/c8ef713199a287c871667fd49bfda923fb5fad42 |     
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/0fc75a612e6539efa28695d420cbf18184954d8e | ORPH
  riscv64    |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/d0dece26de133da90953c64c9b86a52516dc9106 | ORPH
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/b834467903a0ba2bcb09ec29b2f8755baf67bbec | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f3e6ef6b2f1af93c2c3c99e2015714699fc66dd2 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/cd74c17ff5278924145e8cfdeda925d8dd54d2ea | ORPH
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/8b9d3ffa28204a567d54c8fd87aa6481607a1ee0 |     
    i686     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/2c7625df05c1efde8aeeb0a374a3c63c49f86def |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d8e868c59aa9069a3e01137adc19f02e6764b251 |     
    arm      |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/1bcd8e3b60f4a8ef341865cb492c259b0744cfc7 | ORPH
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/17f6b04b70fd42deb7c7451d71767abae6f1da45 | ORPH
powerpc64le  |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/40a26d9831667233944e6aabf2388f02a8cf30ac | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/4b68f5b61312c9d87b59363b57f2b0e54ffa326d |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/cec87bf81fd977e438c1b8e2f0e5868a34c2dc2d |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/c7d1dbb79a697efc1e921b385a0afa503de3cb22 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/ea3b7b6922162489c2412600b5a6693638bb91a4 |     
    i586     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/3ee36149d7dda1da8da194df637688e9f43783a1 |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/c586ee27e9b1be90cedfc38768add2097fcb1680 |     
   x86_64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/b2af788932b0f1a12e466be2344e569ee8124a29 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b044aa569a13358560cdccd9cb2ecb29c5031da6 |     
  aarch64    |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/d25ae0938292d427eebe30f3e96dcf5411474235 | ORPH
    i686     |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/89ea478eefbe1ceff432bc8dc06f6dd26fa3ade2 |     
    i686     |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/8c686c59970d5bad2b65ec347b85654d6768e366 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/62c8517f46cb5b398f69d322c1be420bb00a88bd | ORPH
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/6adc2d643475ee76f85df921e310f56304788dab | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6d0aab456e8c889a9c8f4b653c1666917b2eba59 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b541accc5fee5ad2b5f121d2987b67af1528d186 |     
  riscv64    |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/67eed12e4ee84f10cd551a8b865392b5f399f726 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                    polkit-126 | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           polkit-126           | NOK | https://autobuild.buildroot.org/results/3ce4cf6278ad93dddde272520dcfb5261761410a |     
  riscv64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/95cc2db55d0c43c848bcbeca420f6aa8147f34f4 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    fcft-3.1.8 | 1 
                  ffmpeg-6.1.5 | 1 
    host-gcc-bare-metal-14.3.0 | 1 
        host-python-lxml-5.3.0 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/34d94ddd75d9f650062983ea665d0cbd640a9ced | ORPH
   arceb     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/4b38919ef12699818d05e3d3f941ff9cbd57b744 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/c3e52efbbb61fe103383d90fafb9db1cb0a3d4cf |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/2d0144a88e5478d15687250de139977855b0efb3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/377f05720b64417c77ba7e7f50d4db017aeea78c |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

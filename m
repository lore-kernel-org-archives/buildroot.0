Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1370AD735F0
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 04:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79FE3614D0;
	Sun,  1 Dec 2024 04:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSNyHGp2sszI; Sun,  1 Dec 2024 04:18:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAF24614D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAF24614D6;
	Sun,  1 Dec 2024 04:18:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1753371F
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 04:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC9A284ADC
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 04:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZfJnB7SzrW7 for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 04:18:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB66884ADA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB66884ADA
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB66884ADA
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 04:18:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385e1f12c82so1321754f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 20:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733026726; x=1733631526;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WwZBeIptuMmz44opq9mKRV70AXiMtzrbBQHPqjDQ2M8=;
 b=e/DoVXt9yAYzB3ZaWEHUdS6oMjLbE5hE7X4VyxVvQn6zRfykDGCcOC2C5MuNuvDzbI
 uZeH/hXdvDPOk9HvLFwnxRVbGMOIReHtPs5h6FkkA8OUKbIE0TDnM2beO5X87gnbPZye
 6MtqO2oHHf50XqARWHztoV9NJoToBWMNQ1wZAx6/EZXQtV6Zj8V74NqJ+CpwDEPeSGi6
 NwIAiDlv9Nl7Yv4UK6/FFvQ0RUgSfKFqude1ju1gZ60OItdi1MMukNO0StifFgASw4Ej
 Kx8R80V6zUZLLgGOsE7w4u7Ku2NgJ1ibuhv0TNYP1xMZc2C0rt+Q5PAVAvPJyiTiPK0Z
 iNQQ==
X-Gm-Message-State: AOJu0Yw6pLqcZ7B4NBq/eGsHjIaK5pAoD4c8Zg3qgsO9cFc840cNdmKS
 OWZ4eWsvDorZHmLbWESSKH65FkjuMibLOQK3Eib10LaR/y24JLqKbEhjhg==
X-Gm-Gg: ASbGncuuPQXRZsu26D/HVaUI1sCewUI6yNveN6q7PFYkSYzcOwnZGrPa1ZF1WBKwOmK
 FCwYmWM7GIOo62qe36aW6RSsmTHqKhRvuxrwXqDAx74aVROOGvJK2PWlQd14X1r9cII+yU4LY0n
 1FUp7mRuhlmFwRpKZfIUaRHIFRXU7Tp/Br1w+JYbBoU+eHsievn3AY3Bhiyitx7ISIJwjYuIkCp
 TPoGrEVCvUpbm8+Cgg+Ggn+YemKqvULJWjXwj+CY8OEv6MCmbRGvw==
X-Google-Smtp-Source: AGHT+IHbC5lLRBOTg6hVYhlSv1dq5u/nhnXvFcBmZjekrQJqMZfh+1LXAIOmzTj3DH8gPdWR38ZhsA==
X-Received: by 2002:a05:6000:1868:b0:382:46a2:3788 with SMTP id
 ffacd0b85a97d-385c6ebb9a2mr18979915f8f.25.1733026725500; 
 Sat, 30 Nov 2024 20:18:45 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c11e6sm349392866b.4.2024.11.30.20.18.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 20:18:45 -0800 (PST)
Message-ID: <674be3a5.170a0220.82428.ea1f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 01 Dec 2024 04:18:45 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733026726; x=1733631526; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WwZBeIptuMmz44opq9mKRV70AXiMtzrbBQHPqjDQ2M8=;
 b=mxZ+M3xXwqL1sDD6FtTkLsd9wowrMMcUU09wVqs7/fDoavhKCD4Ds834lcaqxBlT85
 Sgok4X7RiVLPjt3MuSBDkaiNaLbBAadPetbnGjuNgpm34PxThOwGq67L2jwKgt9Ibx7t
 g/0Fxzeaos7AodRaEThT8GMi2lmDcDe2XZZILvGw57U3emkbecUUjkOUWxjDi4QVyqZ0
 yCdyjlyXaeXhZ1QutkXq18P0Nc5mwBuMDDMbLJD5iP+4qoe7DmAyBfWF8eLSr26QeZp4
 WejuIPvCp6pRBGugQcTXRiTYVb8WEsmhVwRlUns518HKGwvVrIHiacIDPxy6B8dtGVa0
 01Jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mxZ+M3xX
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-30
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

Autobuild statistics for 2024-11-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  1  |  0  |  3  |
  2024.08.x  |  4  |  2  |  0  |  6  |
    master   |  7  | 66  |  1  | 74  |
     next    |  2  |  1  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

                 linux-6.11.10 | 5 
             dahdi-linux-3.3.0 | 3 
            host-binutils-2.42 | 3 
            netstat-nat-1.4.10 | 3 
                       unknown | 3 
android-tools-4.2.2+git2013... | 2 
                 c-ares-1.34.2 | 2 
  gobject-introspection-1.76.1 | 2 
         host-libxcrypt-4.4.36 | 2 
    host-python-greenlet-3.1.1 | 2 
 ibm-sw-tpm2-rev183-2024-03-27 | 2 
                 openssh-9.9p1 | 2 
                   perl-5.40.0 | 2 
             util-linux-2.40.2 | 2 
                  assimp-5.3.1 | 1 
                    bat-0.24.0 | 1 
                   crun-1.18.2 | 1 
                directfb-1.7.7 | 1 
                elfutils-0.189 | 1 
                    emlog-0.70 | 1 
                  ffmpeg-6.1.2 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
                  fwupd-1.9.20 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.40-18-g564178076272... | 1 
         gobject-introspection | 1 
               graphene-1.10.8 | 1 
         host-gcc-final-12.4.0 | 1 
              host-rust-1.82.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
                jemalloc-5.3.0 | 1 
                  libnss-3.106 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.0.2 | 1 
          linux-5.10.162-cip24 | 1 
                lmbench-3.0-a9 | 1 
              luabitop-1.0.2-1 | 1 
               mariadb-10.11.6 | 1 
                  ntp-4.2.8p18 | 1 
          obsidian-cursors-1.0 | 1 
                   pcre2-10.43 | 1 
                 pixman-0.42.2 | 1 
               pulseaudio-17.0 | 1 
      python-autocommand-2.2.2 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/556127ceffe11d3674f23fc008a8a14205d04ffc |     
   mips64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/67ee53ea8b4794b66cea1a59cadfeb9e139357d6 |     
   nios2     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/679c1ad8f3215f29666667fd90323138a281f90c | ORPH
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/312a87f43804e21b1de2d46d9459c947b1efd5a4 |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/cdc2bbcb6ce8937edbbfbf782ea4753a8ef8faf9 | ORPH
    sh4      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/d292353afbb4beadc3a65c95c40afbba96348f24 | ORPH
  mips64el   |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/583e16eaf516d5e4452f598386d7f85ddaadf4cc |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d570218ec80bb82d24667964ec5a871991b8c305 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f11ea80165baa27bd3cc77d90844189b9f7e8a21 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e5acc94e7b18363801589467f0279bc799ef7dba |     
    arm      |         directfb-1.7.7         | NOK | https://autobuild.buildroot.org/results/a0330467af7c225cc827e846934b1b1f7b05da25 | ORPH
    arm      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/e2761311f227a82e3e4614af2e6dfe2c36c072ae | ORPH
   mips64    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/00c1ed033da3edc21d530c7501361e6f50ee3b58 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/fee57bcdefa1d14427c234636bd0a4fe4b326929 |     
    mips     | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/32d10a4b52d05b3d8928d6c266d8e7c4c57d1abf |     
   mipsel    |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/b7e3912013f661e1d8019deabf4ede7f689d5c84 |     
   sh4aeb    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/09aee051a3923f85258e878e5f20d134d77eaddf | ORPH
   x86_64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/2849d79b627463771328ba4aacf9ce09017c6d8a | ORPH
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/1ff1e0d90762f78cd6ec689898d081e7a882bc97 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/b188f490444a9f02518a5683f37d0ffaf1b224e0 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8b39385cd86b1f997d88c6f89910668ca3ac1161 | ORPH
   sh4eb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5374924061c7b97257473cedd58e339bcf0617f9 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d68e4c02e01b0b884a15ed46663dcf158ce4e761 |     
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b9e36aa77e6c27aad5d8f884feab4cea13bbd75f |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a2e6141730d1bec4ec62c260e208012db71ca0e9 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2c5f90e7ee61b7028a354295c1e837895ebadab7 |     
   arceb     |     host-gcc-final-12.4.0      | NOK | https://autobuild.buildroot.org/results/f35cd7cdf91dedd03665dd50ffdab65074f8e9f0 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/d6b591faaf0f83972ed908ac180aeb5e0bc7c649 |     
    or1k     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/6710c48ea4ec1c69e5336d6aa851be93750ac5e7 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/80b71f644ac47e61e3796595130833545a247f20 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/3459723a8c90717dfd126df89a50a2f3c7a86aaf |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/563240378198219e44d5ac8e3a72427dcf99d823 |     
   s390x     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/573feb28dd960d13808c088db5e6b6c04ecda14f |     
   arceb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/a98e3d5b897e26d43e105fa8725be3883d579f61 |     
   sparc     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/febbc39829438c2ef81b6c1f09766e3a9be44b0f |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/23dbf6651f199a42e944efdb1daf4bea6624fd8b |     
   x86_64    |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/224709ad868096023e837854c00fa02d02db3133 |     
   armeb     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/b1eb16ac6c3eb94cd35125fcf9077019906cbabc |     
   mipsel    |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/8b36be5ef183684651352f75c0bea820da8541f0 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e26a222bc504d2f1a42e895b20a89298b4848a11 | ORPH
  powerpc    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/6d626e2d9bb852906916ec5c6ec4afd7b5a155dc | ORPH
  powerpc    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/a347e97722d1f47505bd67890d6b9716712d065a | ORPH
  powerpc    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/d8740d0ff274369042cd3da6557dadf4de2acd5a | ORPH
   mips64    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/ac4e0b0bb06fcd8b6e8565f3b207239e20a3fde7 | ORPH
  powerpc    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/996b4e75d927c02b45fb196332a275f0c10b4c19 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/29aaa07e9c4e23d641c1c0f0b69063fe8a81a6d1 | ORPH
 aarch64_be  |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/310ca189f28943220f77f4d88a1a939ff5fef7c9 |     
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/75833ab89dc0cd8a69970075f5091d674f831fc1 | ORPH
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/14e10711f1ff3ae43e4c03e04e08a51f951d5d1f | ORPH
   sparc     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/74070e069424004bad758ba593981d3a26eaa0fa | ORPH
    mips     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d542c3efdfc55f1d05fca8eb2a8918d84344d428 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a3391cf24dfa55606bf519648765c374d5786dc8 |     
   mipsel    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/4211543a52d71c4f85066120608f2f4ac6ba4bad | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/3f92f81965e1706f78531a809599c27dd94f9281 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/9d2a1b9aa93847b3ca41f974ca6ea4fc28f37a90 | ORPH
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/bf35f00a6c3cdc29f5ada9fbe2d18673a3af7872 | ORPH
    mips     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/3c8faa019bd96e4e03c1b9b9eaeaec171da14a79 |     
   x86_64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/efc722248a068f2a4f30753aed2ab73dabbc620a |     
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/bc9b5270de89676d400bc20e472c4d8ef7f7ba34 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2fc57b33248dc2226771618d32342377934d788d | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/e3af48832db079da31a131894b9218c4b58c8c22 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/e99b058c273d1c569baa463fb6a60af6be3d2b1d |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/12b4c5bc7f6c5f8fe68a9134d94f38b3db83f6b6 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/daf72f00fcabc4f407ae01b0a4aef0f2105902ce |     
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2a60084efb9ae952b06af7abda8c2100491bcbb0 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4dcc19f51c9233c20ceba1664ce827cc75c798ab | ORPH
    arm      |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/3b6b4f1c48f7d12e6b7f22eab17dfa99930829a6 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

esp-hosted-6a25417fc880fd74... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | esp-hosted-6a25417fc880fd74... | NOK | https://autobuild.buildroot.org/results/ac14faa005d243f58c3b1be54b8f6a248266d08e |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  libsepol-3.6 | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/0c61a9a9b063b88fed3b4e31301356136645d1c5 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/724cc4f39b7cf2245f6d4c906c4abb395a649b1c |     


Classification of failures by reason for next
---------------------------------------------

                   eza-0.18.22 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/e0c50f10f5eafd0eeab4473ed6fe7cd45b946ced |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

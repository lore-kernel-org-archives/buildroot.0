Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31ABEFB7F9
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 06:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE1B41C3E;
	Tue, 24 Feb 2026 06:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ue3HgE8Eu2M5; Tue, 24 Feb 2026 06:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D40F41C31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771913606;
	bh=aeALmPH1cV7OkGGN3eUiAYY3uOv5cNt5GPlDSw26B5g=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ro4fOueEXZi5tKiKY5J0NVuj68X+nrfP7QkyAbTtRNW32HaoYs+BnfAExwJ68mXrL
	 1aPMtbfaeZ9OdktPP2zigRKjcME5WWkmWqC1b7+6du1yPEozyeQb9ziALvvP5tnhbi
	 yqDm9yCM1ma+zn1XMLsmZ0mzo/ZnFoe2FL9sZl+85odJItPI6Pdj64173K8MC5dJ/e
	 tn/pyOSQSoJQ3EDE4C7k2TcUr6aAZbiX66+7exUvXIG3o7tK9/n+l2paQG40TwgjrB
	 YwMPwogKVRgwp1Bk0tKOdpyOKeLYlq0+mL4r+Dwigpfkim39M/VowhkB2t3kH0vaBg
	 ICcMpuXgMd+TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D40F41C31;
	Tue, 24 Feb 2026 06:13:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6253A1B8
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 06:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53A3B4022D
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 06:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNRWUbzezSPw for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 06:13:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F4EC400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F4EC400EA
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F4EC400EA
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 06:13:22 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-59e4a04f059so6410373e87.2
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 22:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771913600; x=1772518400;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODgm0PAPQHbFChDbjZ3D0uzWo2Jla3pT9klN4Y4481Q=;
 b=UlB9OHAiNnfxpyv8p7nsOuSv+tDtZdz4iEq5Oc+lUoD5PxrcKuLcGlA/eu3yPCsOvm
 7ZjZwMz+KWrnJE0bTqo1ASpVe1760hY/gIV83Jb3OePyvkyRRqoZTMOSMrLioG/Yu7iv
 dRTPT9EHfMoWnmymhsh98+7V05K8qZpPH8E12QoLVRTO8P1pzPNIEYGzS1ebLs3XTrCP
 AemSXLmkiub0Es83bIa9sy8ib92I7mGgoTY0Sr9bim9oZ7GrQ1CWvX1lB4gRBS4QPUTr
 TNXcSHAbjkpv+IRIiYWyYqf+0DnpY0vtWsz6dJq126z6jy/9jxDOZCHY0thdTHlA6q9/
 7H4Q==
X-Gm-Message-State: AOJu0Ywl/23lq8GwJNpW8ztijud1jCTxq5SKdGUcb4qRgUqTWmgnBA/H
 FF29MaLf6fxzLiqeeFj+745dsCIn/B0+XmgEp0jCuBTK9W+UmLroVrXuQlFLvMnn
X-Gm-Gg: ATEYQzxNi8wWHX+lR6oignurSg6ExrOz/FWdm7plvg+yIv0TlfYavb8zseNbkVs1T77
 T/PJb53CjObtQlFgyJG5Ed9UA8ugCQ7khoqPmSy7g8B+K0HKtbGk+zbrOxSgMWdb69b09Utfi7o
 Vc3RpRCqr7zOtNkr7cjoHyrbY4rfs3+w4lgHsIQSOmEded4LI4V/vyxOBqb3wEl3AFUGdTKXE6h
 ku+aVZXIoBGqVX/jlaUueB0qUXbefBi8Qgcvq06qpODtYsN9s7YG00/Pgv/vMW6E7CGG6tAdu3K
 CSCyUNCSsqhvUtKH+gdMvGiQXCRttb1IrmXUetesXHZ3oTOmamYkSoSjbVu7jzh/Q05MXSCc94+
 xDUf+xMotE6gFX8dPrxexrRH1MXLqPC87jXiWXr5N6G9m8dYic3bGJJeihNQKQWQ59ywayHF/Gc
 xNSvVvoOXbRvVq7sPEmI7701AhZBGqs8tfrq5am81p
X-Received: by 2002:a05:600c:a03:b0:483:71f7:2796 with SMTP id
 5b1f17b1804b1-483a95c7116mr177264695e9.10.1771907210649; 
 Mon, 23 Feb 2026 20:26:50 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c00768sm22873402f8f.10.2026.02.23.20.26.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 20:26:50 -0800 (PST)
Message-ID: <699d288a.df0a0220.186cad.8a29@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 24 Feb 2026 04:26:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771913600; x=1772518400; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ODgm0PAPQHbFChDbjZ3D0uzWo2Jla3pT9klN4Y4481Q=;
 b=ATOaFgwo9fj2QmDZ4dtDoDshEi2daagZUY+aa0MSFns0fbko8xB14rGizYXMprTGCP
 VaxOKCDZBaV1ggVp7NOOCS1lZvnDhLsNC8oFoEBtQ3NROo910rNKaT7FzQYoN30oL2ao
 oWnCeG3FlsnUwf34fNNMwc2JBZAz0jD76K3icuD8KdipxPZGQ9EgDxuu0OlzwG62Iqoj
 SMpuIvyO44aQ81fewe6AZjQlCUsVLe7AeYoGkTAaL7YDMnw4UIGUH6mYJnD0sJY2syN9
 yaF6r71qAKW7On7vm92g1YnRZvshdW1Qrq/8pTwMYD569MjLU50VkxXIIDW+Uv1J1DuE
 3XRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ATOaFgwo
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-23
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

Autobuild statistics for 2026-02-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  9  |  0  | 10  |
  2025.11.x  |  2  |  0  |  0  |  2  |
    master   | 46  | 54  |  1  | 101 |
     next    |  1  |  3  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

           ghostscript-10.06.0 | 3 
               openscap-1.3.12 | 3 
              skalibs-2.14.3.0 | 3 
             dahdi-linux-3.3.0 | 2 
glibc-2.42-51-gcbf39c26b258... | 2 
  gobject-introspection-1.84.0 | 2 
libdill-32d0e8b733416208e04... | 2 
                       unknown | 2 
                busybox-1.37.0 | 1 
                  cairo-1.18.4 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
                    fcft-3.3.2 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
              host-rust-1.88.0 | 1 
                 host-rust-bin | 1 
            igd2-for-linux-2.2 | 1 
                   iotools-1.8 | 1 
                  iozone-3.508 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
              libopenssl-3.6.1 | 1 
                libressl-3.9.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                  linux-6.19.3 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250930 | 1 
               luasyslog-2.2.1 | 1 
               madplay-0.15.2b | 1 
                memtest86-7.20 | 1 
                       mrp-1.2 | 1 
                openocd-0.12.0 | 1 
                openssh-10.2p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.0 | 1 
               postgresql-18.2 | 1 
           python-brotli-1.2.0 | 1 
                   qemu-10.2.0 | 1 
                 rtl_433-25.02 | 1 
        s6-linux-utils-2.6.2.1 | 1 
       sp-oops-extract-0.0.7-1 | 1 
              tailscale-1.78.1 | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/f0b9e9248e5320ac1cd9bab1fdf755a34121bb2a | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/823baf1f272b92a74d377fd266e93ef7064ac622 |     
microblazeel | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/64e02bd1dee0c62551b5585e74789c1994824a28 | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f1d01fb57bcdfb55b0d7522bbebd0981c026ee65 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8f98c4a189c2028143866882c8170dc76983a924 | ORPH
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/ce36e6d4e06b693154d69c82c8d66c84b3d27fde | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/983588df1fd9b1596c8b342b06d430bba21e31c4 |     
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/be654dbe9dbeb589172309036cf39070bb9b1329 |     
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/3a2e26f666845f64de6db93d324a370fbca0c5a3 |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/fe6203b733db1e8764c7ed07d48075455c2cfafe |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/6a92795af3384e6a76758e6de5aa767ca9af72ce |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a4286d42fdcab856b1144fa6fdb8a7d2830ba1e7 | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/205ea656b1db7963b6544fd7ee112b3831ec8880 | ORPH
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/cc8a78061963417cbc7db197dc187e3079943c33 | ORPH
    sh4      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/3f40a5aa2c05721398ffcc2f88ba6f9a276904b0 | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/ea21c09ff67ecc96a8a5f9e4ae6aeb4d933a6e8a |     
   x86_64    |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/b2409f1181bad1359dd0922c61456ab83a8c29ad |     
  powerpc    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/357d63f66c707fac58e293a22d1e52a2fda6a989 |     
  powerpc    |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/18a9180cee131343c2a8f9f4e10118f3a7138c3e |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/6926ccafd004d68645b01bb477848718bde239b0 |     
microblazeel | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/0712829089d760094fb7a9f02ce3687382333e3e |     
    sh4a     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/7b01e10c5dbb1e084257a83ca93a4bd4ec680aed |     
    or1k     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/10e0662a407fb2c01ac4aaaad3378ad860cd30df |     
   armeb     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/c84626ced8b0fbf0b24831b6a5c430b15dd36a70 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/c846d90324a1bdc90f1e1ac31b5764ac9292c383 | ORPH
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/94afdcff9c8864e8c5d17a6beaf9ded17f7551e3 | ORPH
    or1k     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/931020f1a07a3a2043a06b7238d4ab95d2910443 | ORPH
   armeb     |          linux-6.19.3          | NOK | https://autobuild.buildroot.org/results/7ee4351aa899ecfd51fce04a05629afd952853b2 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/787a7ca6eac93710bf00495b7aa8c6d355aeb70e | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/175f794baf115fab1774d227e6d235af828539c5 | ORPH
    sh4      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/fb50ced4b5557f60e81de8d0366191d5d7643625 |     
microblazeel |        luasyslog-2.2.1         | NOK | https://autobuild.buildroot.org/results/977ddd0122c0fe5e3eb7f56aa978598f34011e56 |     
    or1k     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/93bafd25059b5a72bad3f3858216798dfcabf52c | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/766ab74f3bde124636b60efbabf5a86fe0068c22 |     
    mips     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/c1088c552f82737532c6d2f265f3d4af185ea684 |     
    sh4      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/d394771daef8c51a0c984873cbec41c37ef9c9ff | ORPH
   sh4eb     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/06f79ab4ca96d62c0508fa4f515417e7d87a561b |     
   s390x     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/984600c0aaccb1b84c83cd021b1217a505e75732 |     
    mips     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/c6827175095bfef40690ec0d50fc1013469dae9a |     
  mips64el   |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/a1ea4994b40ee96c5d76d74f546a22ca21f99efc | ORPH
    arm      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/7c090cbffe86c798f2179259d8990cbf5f89e1f5 | ORPH
    arm      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/11ec3bc5b6c17fa0e7d400919ae02ea96505cb46 |     
    m68k     |        postgresql-18.2         | NOK | https://autobuild.buildroot.org/results/b22f444d7e69e2886eda6a08c9a6797e652f022e |     
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/4bff25c27999c15eca5097a9f59769c9d6e6de3f |     
   x86_64    |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/e7ab3d0cd15da8aee530a7141ed457cd4efb4a75 |     
microblazeel |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/c399534d18ec972df937ecfa66b09bff6100ca0a |     
   sparc     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/367a0b30dc2a90cacd22c1016af00891f1eec4c2 |     
  aarch64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/0c0712c9993352b9e21da024b7c1cca1d70547dc |     
powerpc64le  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/f4c09bef2746295c09a249b2c5f1f9b1eb5cc3d6 |     
 powerpc64   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/e18c3a0281ec79bed5e3d291f9b140ce3c1cf8f0 |     
    arm      |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/874ae4f45011fd097fbc50071ac39252bf05bbe0 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/ab0c78462e4153ad13fda1fba715d47703a1174c |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/0d309fdbc18470d32eae1ca632ac61b17db95b37 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/870c61e57b5fff7df5915f671191948a975a0859 |     
  powerpc    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/311421a7ebed4c1019c60a7b07925a0c66c2d977 | ORPH


Classification of failures by reason for next
---------------------------------------------

              fftw-quad-3.3.10 | 1 
libdill-32d0e8b733416208e04... | 1 
                 libzlib-1.3.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/cdfb71182c929650890797b1d6f71873eae75285 | ORPH
  powerpc    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/33813567a7ced688c241d8505615893b8a194feb |     
    arm      |         libzlib-1.3.1          | NOK | https://autobuild.buildroot.org/results/d592a71322ac72baca58982a6fbfac5edbdca0cb | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    gdal-3.8.2 | 1 
                  libnss-3.108 | 1 
              libopenssl-3.4.4 | 1 
            minizip-zlib-1.3.1 | 1 
                nushell-0.96.1 | 1 
                openswan-3.0.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                   taskd-1.1.0 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/da6afae92c7a81ab35bb27252924e6582afa0f0b |     
    i586     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/55ed20684b5a35a62e2532549264cc794dc38f44 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/c3bfbf4abc5b1d1cd10e6a0f40ae9415c1c03860 | ORPH
   sh4eb     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/aff14069750a22631eac8691589c0251cf74110b |     
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/4be4ca3245f58b33d5edeb34bccb17a34cb27175 | ORPH
   armeb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/3828be6a5084a623bdb88eb47af89d76d8dd0b99 | ORPH
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/9bab89f6a9b51e87d32e17f6a92f218b986dd58c |     
powerpc64le  |          taskd-1.1.0           | NOK | https://autobuild.buildroot.org/results/7a4a308534e95ca5e1ce42b3c0eedca6b54e2bb4 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/60a0a518304c223a92f7015f06a4258098a5aee1 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

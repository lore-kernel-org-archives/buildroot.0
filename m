Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968F3FF8864
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 03:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27952822DC;
	Tue, 28 Apr 2026 03:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PFwGxTo8Bzq; Tue, 28 Apr 2026 03:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FF28822CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777346315;
	bh=hxV5Dl+qF5L2o+4iVVKnwbJNHotdIzFZuAjoPJ2cvS0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RV41T8jpjnRulJnXLa0ntT7mE07nGUT2OHS9Qlf26FQ+y/s+QNvpnuKS3C4TBQFOI
	 J+lCvVxgP7UmSGnMm7k92s5UB09DZNlxik4ltl6es8s5LbIR3rpew6XxXaCiPM9Q0Q
	 73YQQHmkAzzWXqv6hgQUR0p1DHpVjvEe4OLs+4H1UmW1iBEfz5VfotVz07/GzwqAg4
	 DQ/Wd/nfiAOcQIhi0vXJas+cmCvboBRDMl+b4TARApMDH/a0TJZ4H6sPD97M76HIIG
	 tjiPQNm5aTv0J5kxmywlgXDn7UcMFD7IMXgyUKt8ow6T8diKxdUCHaTUtmsp0s47VH
	 bGPHWTuUgKtdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FF28822CB;
	Tue, 28 Apr 2026 03:18:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F18A231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 03:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6121C40FBD
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 03:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnuBbu33RBVk for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 03:18:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D35640FBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D35640FBA
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D35640FBA
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 03:18:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488d2079582so128616445e9.2
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777346308; x=1777951108;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SrXrjm7s28zLEsB/J4OcoiIPiSMlX2Z5OGupyfa194=;
 b=Fl40mHsTI3oOcselEu2j+ZepHtKDCIxTGxlTtDF7+M1Io63xKS+wPyxpkIJMQnjYyU
 YcfjtS320SL+v5DvXHynNx918fsu8wIId1J0w1g6MtjgfXiKGpgX31oAD6cuvQ30AUfm
 zDPiU3ZeiqoUStgldQfRERHNbTD31WmMwtzhZbfQUt97t2Ou8l+DxI9IwDY04gEN/FuU
 q6bIKXtW02ew8ZvQFgQJF78Eo0ZuIe5VnlEiGzxTezUuA/sVKe34QwhtK5ML+PKLeZsM
 sdXqVAsiyAC4pmgtAASUpR55Iv2CwfuEolQzZHBymri1I6KORnraG5nCX0ViaU4yc8dh
 JWBA==
X-Gm-Message-State: AOJu0YxFKK2/aYBr7svxkxU9SXk19OIWYMuQmW3khIPE9IvjSI0kbv3a
 /Y2AsAq+FjpPUZFaW307dKO4ku1a68cmJ5TqDdsS7mHjeXybc76Os6v38JzD/Dzt
X-Gm-Gg: AeBDietAUERn65zj576d5a49vQPRChOMsX9FElYoVwRY+jbrV9tDIrjJIbBJYULOo3c
 uiDCZznQ5aE7dG/6CU5vJ+WqpVG+hnLp+RWIgcBvr2jPeRHtJ3HmIn0pW9assJQ0X3LQNx4xIU/
 SAUw9VZTE/99cmim6DuHii5AgMSn+uNdb2vAPGTCdhiGBk7XdKHs8Pb7oKY1Vbi/283z4dS0Sig
 sbZIYiUYm9NFZHpRSUdjUM8KDv2vXcV5hRd/85pVBB+xBziKARj/mVD6kgFFeBLMrz0CLRLap1L
 xQtrRa5UjGzBjbRsvaG89AZe8k/sVTB3X6zjqLeKaj2yn7f+UpEm8BaEl1o/wWuSnlkomqFVqwH
 o9m/V1w7G82L061PbQ93b6UoLdghxOnoLDBqFB3kpSUis3FBg/YvfGbQGaLleey2ILRR85m4ggK
 xPU4iXS/Q2WxZUk2gTmEUeGwIjck2EOyFmqbpqLKmB
X-Received: by 2002:a05:600c:3f06:b0:48a:5970:2005 with SMTP id
 5b1f17b1804b1-48a77aee4aemr16809675e9.2.1777346307550; 
 Mon, 27 Apr 2026 20:18:27 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4463d404f8esm2383124f8f.14.2026.04.27.20.18.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 20:18:27 -0700 (PDT)
Message-ID: <69f02703.050a0220.248b92.99c1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 28 Apr 2026 03:18:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777346308; x=1777951108; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6SrXrjm7s28zLEsB/J4OcoiIPiSMlX2Z5OGupyfa194=;
 b=SDBKv54K1R2p1wZcV9w1uUlPAmIEhQ0ApiQ6+/8IIXMwN24AG1UyZiwqN44PFc4S5P
 Q+OY9C1eriT2AfRSYoqKt4ezN5NgsqP7SKga9kn9zMdH//OVEkkTYi+7AaTeWfK8qHRr
 D2shCnFBQZQdpo1FAVacjGp7X3cAdLVLOt0+Uomiju9LAUyCyIMlqESPW88q3gV+iaLu
 zb5vrTkMh13JAtsex3QK7MY/7uLLP6c/oaVLpWcSGP/k4+eINrgF4rXBUyuEdN9WFP06
 iiwTeg4WCdLAvxSqXTiFkc67GbKPevZp8RBzb7SnZZmxEKCUENPXS9uxEiofgvtbKj3a
 vL6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SDBKv54K
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-27
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

Autobuild statistics for 2026-04-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 15  |  9  |  0  | 24  |
  2026.02.x  |  4  |  3  |  0  |  7  |
    master   | 37  | 68  |  3  | 108 |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 5 
odhcp6c-f19dd37fb467c9cf10c... | 5 
             util-linux-2.41.4 | 5 
                   perl-5.42.2 | 4 
                       unknown | 4 
glibc-2.43-17-gdd9945c0ba40... | 3 
  gobject-introspection-1.84.0 | 3 
              libopenssl-3.6.2 | 2 
                 linux-headers | 2 
                   linux-tools | 2 
ustream-ssl-5a81c108d20e247... | 2 
                    bat-0.26.1 | 1 
          cloudflared-2025.8.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                     crun-1.24 | 1 
                   dante-1.4.4 | 1 
                  ffmpeg-6.1.4 | 1 
               freeipmi-1.6.16 | 1 
                 gnupg2-2.5.19 | 1 
      gst1-plugins-bad-1.24.13 | 1 
                 hidapi-0.15.0 | 1 
    host-mender-artifact-4.2.0 | 1 
                host-wine-11.0 | 1 
                libcurl-8.19.0 | 1 
             libgphoto2-2.5.33 | 1 
                        libnss | 1 
                libnss-3.123.1 | 1 
              libsecret-0.20.5 | 1 
          lttng-modules-2.14.3 | 1 
                  luvi-v2.15.0 | 1 
                       mrp-1.2 | 1 
                    olsr-0.9.8 | 1 
                 openmpi-4.1.8 | 1 
                openssh-10.3p1 | 1 
                   ptpd2-2.3.1 | 1 
                s6-dns-2.4.0.0 | 1 
                    sbctl-0.18 | 1 
      shadowsocks-libev-v3.3.6 | 1 
                  stunnel-5.78 | 1 
                 sudo-1.9.17p2 | 1 
                 systemd-258.7 | 1 
ulog-0389d243352255f6182326... | 1 
        util-linux-libs-2.41.4 | 1 
               valgrind-3.26.0 | 1 
                 weston-15.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bat-0.26.1           | NOK | https://autobuild.buildroot.org/results/c59a4ff582c1a41558aaf02720fc530a5b531a45 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/52fbdd57486b1226d47e4ee7dea7e0b0126ff79b |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/5fbdb43b6cbc3651485647c5ad01f0799f88a8de |     
   armeb     |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/b8fd4b73aaa19c884ac8770e9ed92261ccf91628 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/232c8498946569323218e8257da4d2f4ffbcb393 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8d6b46d6b29bbd1f741728f2c968fabcac0dec25 | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fe007eec82e5441d3974ea1ef27ccd22b8b3271f | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b604af57e6f487c5f0dfcc2ee9e5cbe02ce84047 | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fd10c8bb9bcf99e5c648d5f3c933f131a56b84e9 | ORPH
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/eb9e452ec7aba2df19668d9aed1391ceceb2c5dc | ORPH
microblazeel |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/9d984eb47ce2045c042ec284852b78e835bfac2e |     
   mipsel    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/66fa975c1f8eef306a4df03eb4d966098021b69c |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/5c90f4d9b17ccf86ea9388618576cab7ed550ab8 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/d99f52b6dd50cac8d86350fdf5be549bddea2f4d |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/f1aaa5b703abaf9debc6e50db81dcdee3a5fe7fc |     
   mipsel    |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/3f419ef2c42469651261365c409f35ea0c5d50c6 |     
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d70d85799d0b4fd8ad735eae6fb18d974ace279d | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a4e62d717ce2d2203f07920ece58698b90d18d08 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/cd8b913b5b472b49c854dcefb68722d36c802571 | ORPH
    arc      |    gst1-plugins-bad-1.24.13    | NOK | https://autobuild.buildroot.org/results/2d5666324db2fca7ab0419e28481829edca949b3 | ORPH
    or1k     |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/dc01b763d274b370b71a2e37943bf32e1b5b793f | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/437dc2fbaabaf5dea5862eff18de4d950be73c87 |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/d6975ee620931081fd86ca531ab1c21a993198dc |     
    arc      |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/0e988785e4489e3749069367b06b2441b3dddd51 |     
    i686     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/229b70e7f8915ebf37438e0fdc2827ac6319ba9f |     
    or1k     |             libnss             | TIM | https://autobuild.buildroot.org/results/d575d54479d0a29990e14b712d2182ebbf6c18f7 |     
 aarch64_be  |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/085fbdfa49c9ab9d98934644894cb7ab612c8c3a |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/db58e4040ae1cb16ad56783fb30cb3a8f9d1cbe6 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/e9786acf9a3f211bcd0156bdaa23fef76a5337c9 | ORPH
    i686     |        libsecret-0.20.5        | NOK | https://autobuild.buildroot.org/results/ac5f6ad6e09a5d2785b4ea7ba54ee01fb8ab82be | ORPH
  mips64el   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/cde8af7290801f7f905d6ca886fc17a9999b7ee6 |     
  powerpc    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/53580a2bec4b7653e1aa85ed4d59879d2f258529 |     
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/88c018844aaf7870a7303242480b3c543402fe69 | ORPH
  aarch64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9d6fed09f1b6f76efe5281d442e0ea163a0a666e | ORPH
 powerpc64   |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/8debf868f7daa0bba04a7cfab09cc00866e6e678 |     
 aarch64_be  |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/1bc0023e92447788660c37d4fbd101fa06332649 | ORPH
 microblaze  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/cc73e0069c026750d088e2f3b0a9b7ae205a0fdb |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ed25129c11d25551a739f40e32bdf6f3077319ed |     
    arc      | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/e860bbe42bfe682de27bc757bc05440ac74fa825 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ccd838ab910a81354b927badc302f7ac899c5671 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ad90af89fa901da0e95ec0bcec2f228eb4e1e05c |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/cea9c9674e0239526fc1f2cef70678c8dfb93513 |     
    m68k     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/00fba21e33655b211692a8d5b74f3a4e554ee9af | ORPH
    mips     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/1c1f0aeed9105f3f3c22f9c3d6d4fdbe7bd16bef |     
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/dea9f27b652d480cec8219836206ea6bd601c09a | ORPH
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/47edbb0090ab84b0c196f419be4348a191c8328e |     
   mips64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/1410eaeaed806262e6645663543d23988da12359 |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/b130f14488ee2296232173d9a1a836c988fc19a7 |     
   mips64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/538448165292dedd2d72153d810ce8b176297e4d |     
  mips64el   |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/62c4de1fead817698b4c4640dd3da4b7ad5ed06f | ORPH
 aarch64_be  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/be2bfb6e6db81afc4200a8ef1f92110df8fcd7a9 |     
   mips64    |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/138a79d41761a68028c337c457205219764de0b8 | ORPH
  mips64el   |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/a0b74a6b2e1d951e19d66390772a3efce1f7caaf | ORPH
 microblaze  |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/abe9f9c97f67934e829466e04357e4c4a9b064f4 |     
   xtensa    |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/81219cc6c5963d200525629d13615d33ce571405 | ORPH
   mips64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/f046ab1338a4b15fe3695409516459c9401c9350 |     
    sh4a     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/0c221ea8b371fd9784a6e48134e6ca69cce07564 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/8a65c9af9085add2b1b17bba89c024921f1cf3e2 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/6e88322c9ef029bed01797809a71da2d40a68f99 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/65fa3bb13763e06680ab42446cf37a81052d2b35 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/19a0e8473ddce2a5f3e1d56fe3e18b25302978ca |     
 microblaze  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/67773cc6503ae39a8120def01f767fac874b5abc | ORPH
 microblaze  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/80a4389591c9217e136b5dc573ab90d30e4ec729 | ORPH
   sh4aeb    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/224780a9e49ac0c434875a496dc89caa7dc565fe |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/a8f38cb2f0044c4ab4beb15f80bdb5d239a6115a |     
    arm      |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/29ac1d1135fc62cac295c5e70cbdb78970d88039 |     
  mips64el   |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/4b319c41151d019d9744da520d7b9e900efee2c1 |     
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/542ae10ad6177e05a71821e35be1da2c5b41d9bc |     
loongarch64  |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/c47bba09e7d9bb0f0bd1833633641d1116e98b22 |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/3a2ca71e7827296ba3b0b65873f53a2d22aa07d5 | ORPH
    sh4      |         weston-15.0.0          | NOK | https://autobuild.buildroot.org/results/7b81e390f3c3e93d4522de29f7e42930d0880195 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 linux-6.19.13 | 1 
                openssh-10.2p1 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         linux-6.19.13          | NOK | https://autobuild.buildroot.org/results/c8369a8163da8cabf3024ed36048ad373e35672b | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/a5e360b6bdef45ec52e9bf767141cf4af888cf39 | ORPH
 microblaze  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a6eeb071d9cbee00a07cb0759c3c1eaf9fe504b2 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 1 
                   dante-1.4.4 | 1 
                  ffmpeg-6.1.3 | 1 
                  libbpf-1.5.0 | 1 
        ltp-testsuite-20250130 | 1 
                 openssh-9.9p2 | 1 
                openswan-3.0.0 | 1 
                   perl-5.40.4 | 1 
                tpm2-tss-3.2.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/7f5246f068e9e1a290f299ae4d0820102a35ec29 |     
 aarch64_be  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/024118c1d8a93d80de592ac27479d22faec0357c | ORPH
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/b4bdbb3790c11a6f2b68bb598faec9195ed95a47 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/009a58bd20c8906a898bbe3bcbe091ae053efcda |     
    arc      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/8b09cb4699dee6046bb912642f006039e244d81e |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/6149a87b75762d9ccafe7f1b3bd648f2758c4980 | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/3dddc19aa6065c66825287c1532a4a5b6e6eca06 |     
   arceb     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/4f000ab1a425790871406cdc375a79c26ee285e9 |     
    or1k     |         tpm2-tss-3.2.3         | NOK | https://autobuild.buildroot.org/results/6239c257e4ee4993d0cc5a675beb65cb15a9e487 | ORPH


Gitlab CI results for 2026-04-27
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980358 | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980357 |      
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980356 | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980355 | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980354 | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980353 | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980352 | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980351 | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980350 | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980349 | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980348 | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980347 | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980346 | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980345 | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980344 | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980343 | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980342 | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980341 | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980340 | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980339 | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980338 | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980337 | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980336 | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980335 | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980334 | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980333 | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980332 | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980331 | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980330 | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980329 | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980328 | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980327 | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980326 | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980325 | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980324 | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980323 | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980322 | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980321 | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980320 | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980319 | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980318 | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980317 | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980316 | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980315 | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980314 | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980313 | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980312 | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980311 | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980310 | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980309 | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980308 | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980307 | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980306 | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980305 | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980304 | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980303 | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980302 | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980301 | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980300 | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980299 | ORPH 
...tlinS390xz13MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980298 | ORPH 
...90xz13MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980297 | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980296 | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980295 | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980294 | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980293 | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980292 | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980291 | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980290 | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980289 | ORPH 
...cv32ilp32dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980288 | ORPH 
...p32dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980287 | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980286 | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980285 | ORPH 
...scv32ilp32dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980284 | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980283 | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980282 | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980281 | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980280 | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980279 | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980278 | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980277 | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980276 | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980275 | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980274 | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980273 | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980272 | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980271 | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980270 | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980269 | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980268 | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980267 | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980266 | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980265 | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980264 | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980263 | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980262 | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980261 | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980260 | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980259 | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980258 | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980257 | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980256 | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980255 | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980254 | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980253 | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980252 | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980251 | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980250 | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980249 | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980248 | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980247 | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980246 | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980245 | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980244 | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980243 | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980242 | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980241 | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980240 | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980239 | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980238 | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980237 | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980236 | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980235 | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980234 | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980233 | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980232 | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980231 | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980230 | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980229 | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980228 | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980227 | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980226 | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980225 | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980224 | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980223 | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980222 | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980221 | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980220 | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980219 | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980218 | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980217 | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980216 | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980215 | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980214 | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980213 | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980212 | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980211 | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980210 | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980209 | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980208 | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980207 | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980206 | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980205 | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980204 | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980203 | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980202 | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980201 | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980200 | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980199 | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980198 | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980197 | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980196 | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980195 | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980194 | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980193 | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980192 | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980191 | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980190 | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980189 | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980188 | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980187 | ORPH 
...linM68k68xxxMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980186 | ORPH 
...k68xxxMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980185 | ORPH 
...inM68k68xxxGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980184 | ORPH 
...68xxxGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980183 | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980182 | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980181 | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980180 | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980179 | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980178 | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980177 | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980176 | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980175 | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980174 | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980173 | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980172 | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980171 | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980170 | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980169 | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980168 | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980167 | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980166 | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980165 | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980164 | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980163 | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980162 | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980161 | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980160 | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980159 | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980158 | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980157 | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980156 | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980155 | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980154 | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980153 | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980152 | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980151 | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980150 | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980149 | ORPH 
...linAarch64beMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980148 | ORPH 
...ch64beMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980147 | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980146 | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980145 | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980144 | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980143 | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980142 | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980141 | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980140 | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980139 | ORPH 
...xternalToolchainArmArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980138 |      
...lToolchainArmAarch64Be | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980137 |      
...nalToolchainArmAarch64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980136 |      
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980135 | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980134 | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980133 | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980132 | ORPH 
...xternalToolchainArmGnu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980131 | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980130 | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980129 | ORPH 
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980128 | ORPH 
                 TestZstd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980127 |      
                  TestZip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980126 |      
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980125 |      
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980124 |      
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980123 |      
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980122 |      
               TestZchunk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980121 |      
                 TestZbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980120 |      
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980119 |      
                   TestXz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980118 |      
               TestXxHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980117 |      
               TestXvisor | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980116 |      
             TestXfsProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980115 |      
             TestXenArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980114 |      
           TestXenAarch64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980113 |      
                 TestWine | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980112 |      
                TestWhich | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980111 |      
                 TestWget | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980110 |      
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980109 |      
          TestVorbisTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980108 |      
             TestUsbUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980107 |      
                TestUsbIp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980106 |      
              TestUnbound | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980105 |      
           TestUbootTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980104 | ORPH 
       TestHostUbootTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980103 | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980102 | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980101 | ORPH 
                 TestTree | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980088 |      
             TestTraceCmd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980087 |      
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980086 | ORPH 
                  TestTio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980085 |      
         TestTesseractOcr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980084 |      
              TestTcpdump | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980083 |      
                  TestTcl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980082 |      
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980081 | ORPH 
                TestSWIPL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980080 |      
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980079 | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980078 |      
               TestStrace | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980077 |      
               TestSQLite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980076 |      
                  TestSox | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980075 |      
                TestSoCat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980074 |      
         TestHostSnagboot | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980073 |      
               TestSkopeo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980072 | ORPH 
                  TestSed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980071 |      
               TestScreen | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980070 |      
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980069 | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980068 | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980067 | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980066 | ORPH 
        TestRustVendoring | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980065 | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980064 | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980063 | ORPH 
                 TestRuby | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980062 |      
              TestRtTests | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980061 |      
              TestRRDTool | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980060 |      
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980059 | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980058 | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980057 |      
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980056 |      
            TestRasdaemon | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980055 |      
            TestQuazipQt6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980054 |      
            TestQuazipQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980053 |      
       TestPythonYamllint | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980052 |      
     TestHostPythonXmodem | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980051 |      
  TestPythonPy3Whitenoise | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980050 |      
       TestPythonWaitress | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980049 |      
     TestPythonPy3Varlink | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980048 |      
      TestPythonPy3Uvloop | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980047 | ORPH 
     TestPythonPy3Urllib3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980046 |      
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980045 |      
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980044 | ORPH 
     TestPythonPy3TZLocal | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980043 | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980042 | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980041 | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980040 | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980039 | ORPH 
    TestPythonTransitions | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980038 | ORPH 
          TestPythonTftpy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980037 |      
      TestHostPythonTftpy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980036 |      
       TestPythonPy3SymPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980035 |      
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980034 |      
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980033 | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980032 | ORPH 
     TestHostPythonSerial | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980031 |      
       TestPythonPy3Segno | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980030 |      
TestPythonPy3SdbusSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980029 | ORPH 
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980028 |      
...onPy3SdbusModemmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980027 | ORPH 
       TestPythonPy3Sdbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980026 |      
            TestPythonSCP | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980025 | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980024 |      
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980023 |      
  TestPythonPy3RuamelYaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980022 | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980021 |      
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980020 |      
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980019 | ORPH 
    TestPythonPy3Requests | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980018 |      
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980017 | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980016 | ORPH 
      TestHostPythonPyusb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980015 |      
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980014 |      
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980013 |      
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980012 |      
       TestPythonPyroute2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980011 |      
          TestPythonPyQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980010 |      
      TestPythonPy3Pyproj | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980009 |      
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980008 | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980007 | ORPH 
     TestPythonPy3PyMuPDF | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980006 |      
    TestHostPythonPyfatfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980005 |      
...honPy3PydanticSettings | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980004 | ORPH 
    TestPythonPy3Pydantic | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980003 | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980002 |      
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980001 |      
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094980000 | ORPH 
       TestPythonPathSpec | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979999 | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979998 | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979997 | ORPH 
...onPy3NetworkmanagerGoi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979996 |      
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979995 |      
     TestPythonPy3MsgPack | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979994 | ORPH 
      TestPythonPy3MpMath | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979993 |      
    TestPythonPy3MlDtypes | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979992 |      
...PythonPy3Minimalmodbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979991 | ORPH 
    TestPythonPy3MidiUtil | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979990 |      
         TestPythonMemray | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979989 | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979988 |      
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979987 |      
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979986 |      
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979985 |      
          TestPythonPy3Jc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979984 | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979983 | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979982 | ORPH 
         TestPythonHwdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979981 |      
...PythonPy3HumanFriendly | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979980 | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979979 |      
            TestPythonHid | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979978 |      
   TestPythonPy3Gymnasium | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979977 |      
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979976 | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979975 | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979974 |      
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979973 | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979972 |      
         TestHostPythonFs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979971 |      
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979970 |      
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979969 |      
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979968 | ORPH 
...Py3FaramaNotifications | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979967 |      
       TestPythonPy3Evdev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979966 | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979965 |      
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979964 |      
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979963 |      
   TestPythonPy3DiskCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979962 | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979961 |      
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979960 |      
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979959 | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979958 | ORPH 
   TestHostPythonCrccheck | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979957 |      
         TestPythonPy3Crc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979956 | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979955 |      
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979954 | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979953 | ORPH 
 TestPythonPy3Cloudpickle | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979952 |      
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979951 | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979950 | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979949 |      
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979948 | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979947 | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979946 | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979945 | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979944 | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979943 | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979942 |      
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979941 | ORPH 
  TestPythonPy3Asn1Crypto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979940 |      
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979939 | ORPH 
 TestPythonPy3Apscheduler | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979938 | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979937 | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979936 | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979935 | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979934 | ORPH 
                   TestPv | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979933 |      
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979932 | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979931 | ORPH 
                 TestProj | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979930 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979929 |      
           TestPostgreSQL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979928 |      
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979927 | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979926 | ORPH 
           TestPodmanTini | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979925 | ORPH 
  TestPodmanSlirpNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979924 | ORPH 
  TestPodmanSlirpIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979923 | ORPH 
       TestPodmanNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979922 | ORPH 
       TestPodmanIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979921 | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979901 | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979891 | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979884 |      
  TestNodeJSModuleHostBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979883 |      
        TestMesa3DRusticl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979865 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979858 |      
            TestJailhouse | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979771 |      
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979699 | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979683 | ORPH 
...yfsVarBackingMountUnit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979670 | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979669 | ORPH 
...SystemdRoFullOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979668 | ORPH 
...emSystemdRoFullFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979667 | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979666 | ORPH 
                  TestXfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979656 |      
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/14094979589 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

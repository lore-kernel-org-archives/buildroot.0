Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528D3E68953
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 04:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A27BD80F27;
	Thu, 31 Oct 2024 04:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6pGWVdQcW1v; Thu, 31 Oct 2024 04:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7A180F1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D7A180F1B;
	Thu, 31 Oct 2024 04:19:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 234AB494E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 04:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1102240637
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 04:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ByTCxpO4HO8 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 04:19:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F00B40631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F00B40631
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F00B40631
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 04:19:32 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a99f1fd20c4so64243666b.0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 21:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730348370; x=1730953170;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PdU9BlcPo+2ydoLziON9pLr3E2In8SKoWneDTrp81XU=;
 b=oXxb2c3bt/+w9ArCt839DEkSqeftj4XeiB1CxUItLHFcyErwLdIEFoipLV+HtUhegV
 anNy6BckAwEwB/gHMfMY74aTFs1k84FUVbmwv9kZn2vVf1e99CjOGvpWUqgj2dDsMUf5
 E9MOANOeQLRskJCJfiT2jbeDhyzA9+XD/kH2MkkeI0Qc2Goy+g8en9PK6G6OPnjGA7c5
 OrG1JPsBfLoyQfuA4kGtYSjTswcon1wvyGh1V7A4nbVAmUXm0T9YZcXZvITumuNye3h/
 7N90BX4ObGUnE/vTNEIwpUZIh6RvovcpzsHT9D26zzXzH5Zaf+aXn+XPm9c49gGpgGEA
 QOeg==
X-Gm-Message-State: AOJu0YzcBI6YZgYtAsAIYMRVSuWSNr/BmHU4UhLnjVXGcS4zz+SW0M64
 heOaDzVfWDLnnLEpw+QudDQ1c7LB3lmwNVFpqQBSOQJIaL0UmRQh1vcELQ==
X-Google-Smtp-Source: AGHT+IGmJeNDI1uSfLGi5stxVjlJGXSdNVZZuwJZV1BhQMKJdOWSssK0mpAD4aMLv1Q5sTYwN1+HJA==
X-Received: by 2002:a17:907:3da9:b0:a99:e98f:e73d with SMTP id
 a640c23a62f3a-a9e5097d255mr153087066b.37.1730348369955; 
 Wed, 30 Oct 2024 21:19:29 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e563093e5sm24882766b.0.2024.10.30.21.19.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 21:19:29 -0700 (PDT)
Message-ID: <67230551.170a0220.206b2e.0bde@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 31 Oct 2024 04:19:29 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730348370; x=1730953170; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PdU9BlcPo+2ydoLziON9pLr3E2In8SKoWneDTrp81XU=;
 b=H8WZJtahVPTuBxP66vdYcKDVHlSlHhSavXSwwL03JARIPsahMLcR4JXsiKOwEG6ZqW
 ipLCGwHvNLaB/hka3QaE40IvjTMcp+kOXDa82h3RmWNGbtoaxXSFqGL+Jkw3hhd7eHeL
 aGwnO9Jv9+744Oq88kmF3D5mMeen4seTNPUTraSiNV7eLZ+JQbaZsHfHN6WiFScjjKrj
 T9o+SWzl+MF7dws5mfJS5ATmxsvyprNqvv6ZLS0fvQWjdb+LP0iwy8mh8P6D7iSOrnUp
 1Jb0D3k9iGG6e/X4sK1w7Rl1R04UbvdgbupAbPrs882ASdsGaD4Uz3PWL9khlwu0UD04
 c3/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H8WZJtah
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-30
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

Autobuild statistics for 2024-10-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  3  |  0  |  3  |
  2024.05.x  | 13  | 26  |  1  | 40  |
  2024.08.x  |  1  |  5  |  0  |  6  |
    master   |  6  | 21  |  1  | 28  |

Classification of failures by reason for master
-----------------------------------------------

           libzenoh-pico-1.0.0 | 3 
           musl-compat-headers | 2 
               procps-ng-4.0.4 | 2 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.3.1 | 1 
                 c-ares-1.34.2 | 1 
                   cvs-1.12.13 | 1 
                   foot-1.16.2 | 1 
         gobject-introspection | 1 
            host-binutils-2.42 | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
                libdrm-2.4.123 | 1 
                libesmtp-1.1.0 | 1 
                 libmbus-0.8.0 | 1 
                ramspeed-2.6.0 | 1 
                 rsh-redone-85 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/244b61c13a0956835ceeeeedb6c76b8935535783 |     
   mipsel    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/7a87f76dde2f0f1d3393f3654d32820bf87987fc | ORPH
    sh4      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/7733133f5d5cbfd1a3c0063b89de1e76de2f78ca | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cbb1259552671ea6a7d3aaef63745c88c1966df5 | ORPH
 powerpc64   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a26ca59183bd3152bc23ca5c6f457219e607775a |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f5c95f73cde6dff2c508708691cdf58afce13344 |     
   xtensa    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bb84229c6f992e245816c59ad0e6c87cbf4c6d86 |     
powerpc64le  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/65797a08ce1a3c2be1f98a597e9f9b8dc8422387 |     
  powerpc    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0bb1023c059384869b265c5137080289ec29e78a |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/f440ecd97241f5281e4e1a05829e40e7c20688c6 |     
    i686     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/394baf9043a166c36e97284f6c5991d610eb45c5 | ORPH
    mips     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/91a82dc73bf87cf1969cd6a2ddea1809ab9a1613 | ORPH
    arm      |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/13691daf6d26210133feb1d059b3751e36f23ae2 |     
   s390x     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/9cba2a7537bd61cda00a9c2735788351e8ca6b2b |     
  mips64el   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/0efe302e79dfc5195a3b6c0477f23769a43e7fe4 |     
   mipsel    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/31d4e54f0e1fe434fdfd13fef4acf00e04afc084 |     
   mipsel    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/dbdd07b7d9dc5a451ad1dfcf312fe8e0984a9b56 |     
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6a602cce63417fc20735c1a485c369442a0c107e | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6707a75c73c82e3670d8ee6c68e5bd418c2e8791 | ORPH
   armeb     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/01250e5e0ff0e502ede65ec2321144f04fc0c289 | ORPH
  mips64el   |         rsh-redone-85          | NOK | https://autobuild.buildroot.org/results/667d8ba7de4e985574ed3b4a66ed43b9405f2a85 | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/69c6770e437a78f3e3b60e3e9df347e39b2b52d5 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-android-tools-4.2.2+gi... | 1 
host-heimdal-f4faaeaba371ff... | 1 
                   lsuio-0.2.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/4e35a6b317c1eb22fc9995fc70793201d91cb98e |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/98ecfed0f6972cf1cc98edc0bb61209eaf5f6a3f | ORPH
powerpc64le  |          lsuio-0.2.0           | NOK | https://autobuild.buildroot.org/results/0e3e71fa4ce11c43a6ec51eb522f9c19772adeac | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                host-go-1.22.5 | 4 
host-heimdal-f4faaeaba371ff... | 2 
         host-libxcrypt-4.4.36 | 2 
                 openssh-9.7p1 | 2 
              skalibs-2.12.0.1 | 2 
                  acpid-2.0.34 | 1 
android-tools-4.2.2+git2013... | 1 
              bluez-alsa-4.1.1 | 1 
                    brltty-6.6 | 1 
                 gnuplot-6.0.0 | 1 
         gobject-introspection | 1 
              host-rust-1.74.1 | 1 
               ipmitool-1_8_19 | 1 
               libglib2-2.76.1 | 1 
          linux-5.10.162-cip24 | 1 
                    ncmpc-0.49 | 1 
         python-remi-2022.7.27 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.48 | 1 
                       zip-3.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | https://autobuild.buildroot.org/results/aaef83b56fd55e54fcf0df172acc3c09e5277f5c | ORPH
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/abf896bead7d10ad9a4421d4d9ec1dc70b43fc4d |     
    mips     |        bluez-alsa-4.1.1        | NOK | https://autobuild.buildroot.org/results/8ada292393185328677b58a69c9e370c3118880f |     
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/2f9fa57138c687cf028618fdcb49ef0bc0decffa |     
   nios2     |         gnuplot-6.0.0          | NOK | https://autobuild.buildroot.org/results/ed4747c4b811a3b10f3ad8a67041d34c49e529d2 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/647552afafbbe5c16135585b34776b9ec199bd06 |     
  aarch64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/85a99bc7e4ba5e9dd520f999ef7db4aa37172185 |     
  riscv64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/450979eed125bc9ad8e74ad9f8eafbc6614738cb |     
  mips64el   |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/71539b0cdc6d76a734ff098c8378993fb00296be |     
   nios2     |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/7865ec7be06785054d218e8053243f50160d3882 |     
    sh4a     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/fc0c2535a4fcab8aca7969f63feedf8df86fa40d | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/f617a76414ca1b42e4cf91db05b506ce12ba4add | ORPH
   nios2     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/5f9a5cb239c84609116830120cbb1f093f5be206 |     
  powerpc    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/4dc4127f3ebd080721bdabd93beadebaaf4e620b |     
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/9a5d430afa4490d619865a8a60886efa5e287466 |     
powerpc64le  |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/1ffe4c84fa3c2d0c4632af6dad9c70f43c739630 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/f6708151065f3e0105703bf9b146a4cd669715d5 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/52df47e0aa41d7f84ceff070df11af6317629d49 | ORPH
   nios2     |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/b495f6bb6dc20bca208ff58650e13ed4ffa68bd9 |     
powerpc64le  |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/eaf590ee66de7f8f7c377e86a68d2839a8dcf139 | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/3ed207a7dce558a9dde2361ad609f5e1797bae03 | ORPH
microblazeel |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/94d77efaffc4ee1bc973cae2e9f75d7cd9366218 |     
 powerpc64   |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/c5c5ec65b054d364d12e751fa580fe51c0f7e644 |     
 microblaze  |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/623d4dd5ddef4f3ca037289835ecdbc204ff5a04 |     
    mips     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/a53e4eb97d5032972f8f79b88e417780e3a19e85 | ORPH
    mips     |         uclibc-1.0.48          | NOK | https://autobuild.buildroot.org/results/8cc5608f07832943c0b3e388a089863fa0c081c3 |     
  riscv32    |            zip-3.0             | NOK | https://autobuild.buildroot.org/results/1ba8df3cf188ca150d17c685a29577151a800edc |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                 apache-2.4.62 | 1 
              host-rust-1.79.0 | 1 
                  libsepol-3.6 | 1 
            micropython-1.22.0 | 1 
                ustreamer-6.11 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/61b05d143a15516ea0b02333e62e7e8db7adacdd |     
   s390x     |        host-rust-1.79.0        | NOK | https://autobuild.buildroot.org/results/2b55c7073719f5c1a04d6e530be159d8e3424999 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/ff2fe92ec764f74eac6165660de966da46e6a8fd |     
  powerpc    |       micropython-1.22.0       | NOK | https://autobuild.buildroot.org/results/a818bb410e8149011bd47ad7ac999de6b8aa9e10 |     
   mips64    |         ustreamer-6.11         | NOK | https://autobuild.buildroot.org/results/7e862191d71b8a699a0c1ae878bc813edc29a40f |     


Gitlab CI results for 2024-10-30
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992244  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992746  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992310  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992311  | ORPH 
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992419  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992759  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992760  | ORPH 
...ch64beMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992765  | ORPH 
...linAarch64beMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992766  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992778  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992779  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992784  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992785  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992790  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992792  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992797  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992798  | ORPH 
...k68xxxMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992805  | ORPH 
...linM68k68xxxMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992806  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992813  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992814  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992819  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992820  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992825  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992826  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992831  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992832  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992837  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992838  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992843  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992844  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992849  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992850  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992855  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992856  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992861  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992862  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992869  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992870  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992875  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992876  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992883  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992884  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992887  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992888  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992891  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992892  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992895  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992896  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992901  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992902  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992907  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992908  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992914  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992915  | ORPH 
...90xz13MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992920  | ORPH 
...tlinS390xz13MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992921  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992925  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992926  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992931  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992932  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992939  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992940  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992945  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992946  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992952  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992953  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992958  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992959  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992969  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992971  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992981  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992982  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992988  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8232177065  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992748  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992751  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992267  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992269  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992335  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992337  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992338  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992571  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992596  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992600  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/8232337680  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992642  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992646  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992675  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992687  | ORPH 
          TestPythonPyQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992664  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992271  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992274  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8232367821  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992276  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992278  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992257  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992259  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992740  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

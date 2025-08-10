Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDD0C87FCB
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 03:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCA7F40C68;
	Sun, 10 Aug 2025 03:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDjLmM9o3XsT; Sun, 10 Aug 2025 03:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F0AD40C6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F0AD40C6A;
	Sun, 10 Aug 2025 03:15:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A85C31
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 03:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 524064008B
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 03:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_6pd6FhZI2f for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 03:15:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AF5040131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AF5040131
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AF5040131
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 03:15:10 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-617b36cc489so6521795a12.0
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 20:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754795708; x=1755400508;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CEvg5thJkqVWcqFtdNSZc3HrJWDUtd4dKDcya2PhJfE=;
 b=STDQhv3OugVIHNV3ZB1uWrfLVrA88uv6PQ4x+V0xH+jH/deMPr9pl7n7Z1dojNYqk8
 3RUSFI2YD533/sA6g+iAh+T/Hx3EWz5SACs1nr6Kjebht0frpPCdcU0CUNRQoavxTKmI
 aV15DsePN6ZUZzSbh9x3APnUO5/vAkdI+wA6liRkO57Wtda9Ocgs+qJtad2jw8kU3MuX
 OO+7IIVKxVOHCqVL+CEW0zhO0G4X2XHjvvFU/K4mYJzTzhwWWZNnxBnloPTnO5Bjm59r
 HFtwkF0/0JhGAGdzqJ1K9RZy1huCUy9aE4T7rCe7DMNw9Ppmaq5w2b+Tc5dlyK+s98eQ
 6Vgw==
X-Gm-Message-State: AOJu0Yxgog3lbW7+L+Zk+epNHWloyymmiFOlt145fbPYrLjkJOpSGpCk
 Qml6WonOWKshxZW8rSvhuTAQ/TX613epn/eBmEEW2qA6iMCvW1RQj3uc48mekQ==
X-Gm-Gg: ASbGncvLJYzSEgTXUk71y1LezglEQNx5OjM8tzk+/KywwuWdV/jdpyrpFWjz0pbGTBN
 dyaz8i00bdJ6EbFaodA1nsg6OrwUi0OG1LJQGl7pKfaErIxVuUx4+Y72GjImKNuPqO+ZA/LMk3c
 yUd1V/WOB+FZqULzmWpvUy9oLbfO9grg6YMfymVViApnf8Ydee5Vu42Y9lrpA75zt4CDTuofcUB
 F43YMRI4aJPfv+QKWiuTzfCSo4EKNsc8aXngachPVIk6p6qV+7Jst3y+dpzOIU0HSocOTwFkglb
 wPvvMHtBBQ4/vvCIokZ7v1etukk1PaZ3XChLG/0dZwLZcxEvra6KHbJyA+aQja3lJA+BgvjuHD1
 LjVDq3Ojr8rqDZr6yjBLVC1FApQ==
X-Google-Smtp-Source: AGHT+IF832VyhXO4rXqTfaRFXnL4eXzm/x3SVlXT4yLOSTneq+UNd3M2xscXSmE5zOCgyzRMLY6i8A==
X-Received: by 2002:a05:6402:35d5:b0:615:bab3:9ee9 with SMTP id
 4fb4d7f45d1cf-617e2e579bamr7219864a12.26.1754795707886; 
 Sat, 09 Aug 2025 20:15:07 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7944sm15808430a12.33.2025.08.09.20.15.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 20:15:07 -0700 (PDT)
Message-ID: <68980ebb.500a0220.2ecd7.852b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 10 Aug 2025 03:15:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754795708; x=1755400508; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=CEvg5thJkqVWcqFtdNSZc3HrJWDUtd4dKDcya2PhJfE=;
 b=cTRr3m7o+KaPlwWVO48ERmrgmIdVEvy+7mxG06Hr4r8a9LcQ+Lk1FAdprOu6jq2P7O
 J7fsO/Vs3Rj2oNZCCvbMPusUJTGsXrYSjxuhU9TXgGC0+j6z34YAPYfq7FGpIFIrykLX
 40klCBZcdRow6AScy15dkuFUAE+sx/tC3uXl9vYYHm3SOAkCOyDXi+hFc4LjkPaZwzom
 SgMcOtypeaY6H2H2K6N3PpWOZBCLzG/DaLczXnqzJEzk9dMYGWqFhjjkXMHPOm6uw0Dj
 mLFNyCTResXgW+lbrdpPYp9LGrZeLBSaSONPVd+Vkw89Ud1eJ/OLYVtEH6WV+rN3jsou
 DxCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cTRr3m7o
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-09
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

Autobuild statistics for 2025-08-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  6  |  0  | 11  |
  2025.05.x  |  2  |  7  |  0  |  9  |
    master   | 26  | 127 |  2  | 155 |

Classification of failures by reason for master
-----------------------------------------------

host-binutils-arc-2024.12-r... | 6 
  gobject-introspection-1.84.0 | 5 
         linux-headers-6.1.147 | 5 
libdbi-drivers-0bfae6c43134... | 4 
                   nanocom-1.0 | 4 
         host-gcc-final-14.3.0 | 3 
                 host-gdb-14.2 | 3 
                 host-gdb-15.2 | 3 
                 libgee-0.20.6 | 3 
        liblog4c-localtime-1.0 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
            python-yarl-1.18.3 | 3 
                   avrdude-8.0 | 2 
                   bash-5.2.37 | 2 
               bctoolbox-4.4.8 | 2 
             berkeleydb-5.3.28 | 2 
                   cvs-1.12.13 | 2 
glibc-2.41-70-g1502c248d58c... | 2 
       host-gcc-initial-14.3.0 | 2 
                  iozone-3.506 | 2 
                libdnet-1.18.0 | 2 
           libfreeimage-3.18.0 | 2 
                liboauth-1.0.3 | 2 
                 linux-headers | 2 
                 logsurfer-1.8 | 2 
      passt-2025_06_11.0293c6f | 2 
                   perl-5.40.2 | 2 
python-remi-2022.7.27-37-g1... | 2 
       sp-oops-extract-0.0.7-1 | 2 
                  axel-2.17.14 | 1 
                    bat-0.25.0 | 1 
             batman-adv-2024.4 | 1 
                  bcusdk-0.0.5 | 1 
                 c-icap-0.5.10 | 1 
                 coreutils-9.5 | 1 
             dahdi-linux-3.3.0 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                     ed-1.20.2 | 1 
                flashrom-1.5.1 | 1 
                   fwupd-2.0.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
                   gvfs-1.57.2 | 1 
                haveged-1.9.19 | 1 
 host-softether-4.30-9700-beta | 1 
               host-vde2-2.3.3 | 1 
                 inadyn-2.12.0 | 1 
                       jose-14 | 1 
      libabseil-cpp-20250127.0 | 1 
                  libbpf-1.5.0 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                libglvnd-1.4.0 | 1 
             libgphoto2-2.5.27 | 1 
              libopenssl-3.5.2 | 1 
     libphidget-2.1.9.20190409 | 1 
              libselinux-3.8.1 | 1 
                libsepol-3.8.1 | 1 
               libsigrok-0.5.2 | 1 
                  libsvg-0.1.4 | 1 
                  libteam-1.32 | 1 
                  liburing-2.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    linux-6.16 | 1 
                 mbedtls-3.6.4 | 1 
           oath-toolkit-2.6.12 | 1 
                openocd-0.12.0 | 1 
             parsec-tool-0.7.0 | 1 
                  prboom-2.5.0 | 1 
procrank_linux-21c30ab4514a... | 1 
                ramspeed-2.6.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.1 | 1 
                 systemd-257.7 | 1 
                   thttpd-2.29 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
           v4l2loopback-0.13.2 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/38486aa6c203b6ec35b6d6ad4ede316d32787099 |     
 powerpc64   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/40fa76ae0433d9f1732720f636634b6cd223470c |     
   arceb     |          axel-2.17.14          | NOK | https://autobuild.buildroot.org/results/b53fcf3e895b96b09d643ef9c4665b1672b3ceae |     
   sparc     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/d586290838b0c11af7debd102293343e3d5b9781 | ORPH
   armeb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/0599e21a7c2cff3a6c4b1c0bb6457414e944f757 | ORPH
    i686     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/ebfd5cfd6df2f8c6729f04058cbaedc391e1cf25 |     
   s390x     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/0e4fa9446af6721d086830142ea92feb1c42b8dd |     
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0316c93e0bd7272cad903667576d044cbebc5a14 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/49400945ffa41f79435d7f58d4351ffcf7fc4a49 | ORPH
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/99091193101f1552c397936dd7337037a77bc218 |     
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/651118b235ab192e29204b28de5f9e5b05f6efba | ORPH
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8ca116c48c6abaf20d129ff7f4e0833ad3657936 | ORPH
    arc      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/8bbf69f20f9b990d2dc87bea9eb28d6d9d7bf25f | ORPH
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/2e179dc5c82c39ebd2ec15a74539e841dad7c6fa | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/531895b627627bffb726d2b5e467b78dcd4571cd | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8083b09884fe8b46220e38f9d5159ef9202645b7 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d9d6b507079880ee24bc0f95e3bdbd1a1766b540 | ORPH
   armeb     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/4a3553d88c082d615a196e4163c6309751550eb7 | ORPH
   sparc     |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/10abf93a318bb96bb4d05bb67845654284fead61 | ORPH
   sh4aeb    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/d146e22ac597c258c76417fa584997a439cd94c7 |     
 microblaze  |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/68902bdfb144559ad644b4ec7309bb04a5f7d3f1 |     
    m68k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/45cd2d00cf4f6bf574418aed41c691bb74733c7c | ORPH
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/28592318e466206be670e1126e44476800d3e8c0 |     
loongarch64  | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/35653827d6b7ab1a89b5526becee77b068b02fe0 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/56d637bcfa43eaadc18c277b60d51c1cea76c4e1 | ORPH
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7ff8bf423d319395209e0dc4035cac290953fef0 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6735492beda4fc550a584409c83284c600027185 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bcc00e1b9962f50017047e1a9566f84d1e9bb000 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ed8840959970e2bfa3228865fa5131918907d8c3 | ORPH
 aarch64_be  |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/d9fa0b4621f0a0212fce72b7d7333a7184729fab | ORPH
  mips64el   |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/c394ef046a8d4e41584ade4c8e34991a17b54270 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/482c5f404944843848a400c272f1505fb8a4f364 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/6fa1ff6a35d44dcd1c09bb75d2aae561c56115a5 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/9dae28e6bde29b851fe59fc6ff1966cbccda14d8 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/1a7eb3152543d9d82f3e95499a62dcdf20d994ba |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/5ebe0e7bb5fc00e5203ba4446be8e651216810a8 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/a1df69e990da9e907427c3f62e0dd8ebebf07322 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/40db44c9ef38f18dacf63aff5073afa3e065d0c7 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/64bd3f302b71327ee2df4d86f4288b1073ffbccd |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/5667bebd5dbaa3194ffef3e21f078ccb515e27ef |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/480c308077e0b1b84f97cdc6034656d6369f0c2f |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/7deafb9a63594685ea8e1f59d892706d7c4ccf18 |     
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/348a48253f4dbbfa3a4fd633f806d56e8baea4a6 | ORPH
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/87fb801930d5fdbb9aa1c82f0cc6b6d0c3e87d00 | ORPH
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9a1496a3b5ffb30f12cc897bfee6ffcd1a34184a | ORPH
  riscv64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/747495b6fec379e60916bfb6ba34258583fd2868 | ORPH
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/e7a06645afca711c4cb4ebd429dd3f9c2da5d2e6 | ORPH
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/857cf228b064ec02ddd1be56cc65263a5ba9871b | ORPH
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/62b8c6e70f066e5f07910dc230493a350b6585c7 | ORPH
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/5080ad9e3f77e653900a5e16e564db434adc9708 | ORPH
   mips64    |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/feb10ab15d1813077121eb78be53364e387a7ebc |     
powerpc64le  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/6b7009eede5849be2a4151b398d67703ad1d6e54 |     
   sh4eb     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/085f9f3900bce391b821110339dcf239ce0ec3d9 |     
   arceb     |            jose-14             | NOK | https://autobuild.buildroot.org/results/1588672a7fe6ba8198d0a0fdaf361a02037cab9a |     
   mipsel    |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/9af701815ff9e31c8c3154da3b0336b17829208b |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/4808daf537f204ed843fb52793cde9254429e124 |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/2f9bd924c1be7c35ca378736b7f34f0ffdbecb98 |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/75b105a339e7a1b48217815251b339091c8a2f6d |     
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1c50d653722cf3c56510be402d2c5c5e4052ac23 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/cb0fc9f4b0ec6571761fb0b2798462fba2a3d61f |     
    i686     |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/c25f891f074e87f07be1405fac95e8e048d2f531 | ORPH
    arc      |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/f4278f0972a64c24e7903f23d2d526c95ca5569d | ORPH
    i686     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/be178eb1984457b6ef467c495e2224c5f5b1e9c8 |     
   sh4aeb    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/1d8895b2abf33fa1bafb398e81c3c80ad435ffe4 |     
    arm      | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/2b669f359f860454fb82c4abb690922278790ec4 |     
 aarch64_be  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/0b87a24ed8eb7ed778681255f509834f338a1546 |     
powerpc64le  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/512501e47317ad9afbed6fbfa4b11060981e1153 |     
   mips64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/5c3333722f4f077405350b43b530a404fd81ef68 |     
  mips64el   |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/7ee58364dc6a27382257d45c775742179b44715e | ORPH
   sparc     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/ac7643125c87b815ca9d9e91fe01813f17dc0511 | ORPH
    mips     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/13db1136c667faf980e34c1caf93b439a745b580 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/071a59b2358a1d5345eae3b08c1bad430b442c73 |     
   armeb     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/7807cc9159cc35dc93a26b0a798e84155a87c503 |     
loongarch64  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/49eaa9d10a2b5393a8c6f87351952680538a4764 | ORPH
 aarch64_be  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/fa75b2c7385dacbb564604958d43c656ad7e1d0c | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/1e23317e66363321d10aaebf6a989c454de5faf8 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4f4e2d1d6af865c00394e0a3039a279c818e150e |     
   sh4aeb    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/95fbe1ccd5bfad805afb9223f6450c06c422e7a7 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/5231111fc694f5d84750cabea03259b22f855324 |     
   s390x     |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/ded4346d9c958cfa5a50719d6fecbc95c14d1b71 | ORPH
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/636251c2ead9d1856cc11dcc0905420dfff8a133 |     
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/20a408a4f3c3222caaff1cdaebe4279ab14f2196 | ORPH
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/d9acaaee823d4ecd770f828c47b7bca860acf64d | ORPH
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/7790d9a5c577f6510e3dab3bb4c8cef649ad8bf8 | ORPH
loongarch64  |          libteam-1.32          | NOK | https://autobuild.buildroot.org/results/de50ff256f6fbaad038db0265542b73f6f11ad3e |     
   x86_64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/d8b543d3b100255da45f4ddff0d9041f12e85c27 |     
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f0dab969a61f0cd565d298c8a7c0f900e28176cb | ORPH
   armeb     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/9952d9b12918f2a10127bb2360a1a9b3ec8436e1 | ORPH
 microblaze  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/bd63f087f63de0b6de69ed950b0b16da2c875e28 |     
 microblaze  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/aa2da912a18ef5e07614eab7d1b179ed5f60a3b1 |     
  mips64el   |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/1390595675a32be35c5637673f3f1aed566ca1cd | ORPH
  riscv32    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/21e48a8da1a6c7590191fdca97c407b313318c4a | ORPH
microblazeel |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/a10af1b316640df0cc1cb7f70b00627165db0eeb | ORPH
   sparc     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/ba0d8a091177f334179d7f54baedc462c40dcc6d | ORPH
   x86_64    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/d16fed195cbf8e7ed58337f144ea23c4dc4ac871 | ORPH
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/24716b4bcac45f562f0197d8d2a004d7bca55c0c |     
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/681d6e9d77fdc3813bc2a24089b2125db5a7bd0d |     
 aarch64_be  |         mbedtls-3.6.4          | NOK | https://autobuild.buildroot.org/results/dc64c4d817ebc53a7e90ecfef9918333664b6e63 |     
    i586     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/4e6a75a44b443798f990dc03dc010b3753adea76 |     
   xtensa    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/ebf500c48aaa357aaac3a88d87ef8f5c07cd78b6 |     
   mips64    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/7dd31202380a93cc301b04923870d5a16a01aa84 |     
   mipsel    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/cb1a836086ffbcaeac2d6b61df90557e4e72e501 |     
    arm      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/b98dae0c253a24e164136a91e6f9a6a39205abd6 |     
   sparc     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/244fdf57daf6c74845895725044dd7d64cfed9b5 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/c40cd93be7a1a74e6ea19dd8137d3f4d784b5947 |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/f168858f10c07bad28aab75f7cf2f42d32f11bde | ORPH
    sh4a     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/273e4686813bb239c319e035c29f73f0bdc55dbc | ORPH
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/44fbf7dfdbb5416f8884a1da59c4d3b7a32baa1d |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/db0ab4d0b1627db8a2d021022eefb90f862b3718 |     
   mipsel    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/97cf347dd42d5b930a2adde4bc21350376ff9c95 | ORPH
   sparc     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/36688b4b49fa15d5453e86968af748ffe2d1f857 | ORPH
   xtensa    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/83cfcf9395ccfa50c6058a9429e75e0af9c244a6 |     
microblazeel | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/b64fbc176717d53e1623aee6baab52bebb29f21f |     
microblazeel |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/e6365fd4d38d2f2bc54b54e7e9abd2ae47db5b83 |     
 microblaze  |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/639b45d0a6dbc17962a8ba187bd8cc435316601a |     
 microblaze  |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/d54ad02ead9a8404f9bfc2c66ff36625045ada31 |     
    arm      |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/c1fff8ccc5cea03f478fe680d5a352b5a0e095e1 | ORPH
   xtensa    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/34652899c3628ee250b76294ec8194893ab57063 |     
    i686     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/8c50d5287f12f49cbe09a4d2e3df8b8b802c97ea |     
microblazeel |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/9a922460ebe9d84fda184a9a61190361b242f6d4 |     
powerpc64le  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/823f6c6c4d71a877cd19eb51d064d14347c342f5 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/851ce8c56c3d55713c3f56c932856514c654a6cc |     
 microblaze  |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/40c12a150ad04708c9056ff09b9bb129be145e67 |     
  sparc64    |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/faa15716cfa0d7474dc20d7ca4f9b1a90af9a1bb |     
  mips64el   |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/ad6c7a143bd20f6cb178ac609a995ab6a287ba0c | ORPH
   sh4aeb    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/317fb0b3f0ca0abb75b1d1eed705dabcc16b1f89 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/fd5aa37135623af9e91c1603a9f31d8898a0a47e |     
loongarch64  |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/3c8e466a985d6461f7df32882a20a79c1020b1ad |     
 microblaze  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/fcc483af265158d5b2434067a01866d22765201d | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        python-propcache-0.2.1 | 2 
host-binutils-arc-2023.09-r... | 1 
    host-gcc-bare-metal-14.2.0 | 1 
               host-ola-0.10.9 | 1 
     linux-5.10.162-cip24-rt10 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/dc3a6e4b69c7c660c7c03dafbdb63ce35685e937 |     
  sparc64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/3a228e885cb04e0c91eee470f9622e0e44eec3d7 |     
  sparc64    |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/01ef3117a93168aa4d91a7c4b12ee25d6578ff3c |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0560757aab80941d3020d9a91eefd888b4fdecf8 | ORPH
 powerpc64   |     python-propcache-0.2.1     | NOK | https://autobuild.buildroot.org/results/3364a1cef68e7963482debd7cf0d5f3ba1df498c |     
    arm      |     python-propcache-0.2.1     | NOK | https://autobuild.buildroot.org/results/4ed200161e4cc4b181360b3d6401fb99d52f0bca |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 fwupd-efi-1.7 | 1 
    host-gcc-bare-metal-14.2.0 | 1 
              host-rust-1.86.0 | 1 
               libsigrok-0.5.2 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                systemd-256.17 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/ce8fc1d86c617bc5b8f4fc92422c55188c5875b7 |     
  riscv64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/7bf3c0852ab0acbf3ccfed84227dd95064ef7cb0 |     
  aarch64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/148ab8084a3e277bce289c480e3b89df47d28359 |     
   mips64    |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/ec2c1709d884906f069a046733f1374b80d0b31d | ORPH
   sh4aeb    |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/e3bd3e82a492c8565e9108ef541e004646d3528f | ORPH
  sparc64    |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/43c9f4b2fbba23750f0b3025332f6cde7b9c52de |     
   xtensa    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/673e50a226f5e295e5236a1eaade8f9b80fdac58 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51184CDB479
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 03:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC6182290;
	Thu, 25 Jun 2026 03:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RoU41Qss20m; Thu, 25 Jun 2026 03:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D173582284
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782357974;
	bh=52qjS6JiPePc61NYHj1FrD4sPpfSmvvhbZQumUqyuag=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rkdUsnmn4g0bgQVbdv+Ny1LKuaTasNkkynpIBCDzBW3CWfwHT4/hA/ieixYQJnFLv
	 oCqnCiikJ2xEBd++AIIBYwVxiLnn9ts3wdUgTWULtlG3KLGtO8BzvnebcUPkrODr74
	 a2HRhtPN7Y2RQM4b+Y/075J+NayE/hVUx7PPKn/pcKLVHk8ebIsrdeXpB1dcRyTu2d
	 GtoFpkWq+GJJEuLjAnb1lu5gML+US/MCiXgF842gy05STMGn3qcMpUTBKpWSO9QS1p
	 yr//CbFg/59wxVHBjQUhqcCSpbiabyUlWzCQyd28Rv4CZBxb9cUmxkiPjBQt+/c9k/
	 YCylSkuAYU2FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D173582284;
	Thu, 25 Jun 2026 03:26:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8533254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 03:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E6E460EDD
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 03:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ng3yf6N1UIWq for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 03:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27BE360EDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27BE360EDC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27BE360EDC
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 03:26:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49241dbf9c1so14870665e9.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 20:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782357970; x=1782962770;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFyp/q4KNrJk4HVb8jcTY8SX7Ze9FdQUUYltRlJrE18=;
 b=ZYr4ICLynal9QOD/+2yEPMNS/9M+jfeAaLvKe0HSut+slLDvuPDoG8fUanB/dGPpHE
 UYw0kax6zY7xRCh+DJAIX5aH80bNYV2MoLAxOEdp4SQ8CCByq2GYokfZ1EaLAjE/UaZ5
 XqZ4rucBQORnbLT2CcPZvms0pDxXpSqt5ykV/PujkZwNvy5M2AcIwDAtgj/n4xGVPeY4
 W3HJ5fMeRKZ2Y1w5AlFw0KDk89R1TiN+wjT7S8IWX9vn8NxFd3kGoQlZ0oIrs2vM63at
 w+x2XChvWaZ3axY0UvZ5iwVLIf7O8dy3FjY41ti3S21xRI6M4a8OYeAWqUOybRi7ibwD
 VYXg==
X-Gm-Message-State: AOJu0YyT7GhYcPpuqRvDL5+tjNRozq+NVB3gHhN3oZ8YEb60e8iegYig
 aHAhcaaLIP+NFk4QfmBdyQ9luXJp064LpwznjRi/9mi96O3DcgcKXmRe1UhUL9Zc
X-Gm-Gg: AfdE7clETr0i/8qQfso00odgQEJyAsp/UK3jjQl4lsTS1yDjCEuB7uSDimi/vqvY/2b
 sE//vuhOsuji9r+CqdXUMXKF6ddl7WgSZcyp8d4cnYpsm9crPAI/G71qwukvR5YhryEal9QLEM4
 rqPDD8dAg/+4lnI11LIcELvhxIkQgg8zKdjD1PYmUnYfR8r7HZnGfhsx+M+u92XXqfocymtCX0A
 oP0kfMDEX1DiK9H+mdq49DUj8z16zfHaIUuGEHEtyB+ivEt/Oh+/4VIzqE1qj1/JdoiU3SiVJL9
 hIJssd4GKVb/F21NCejyT7G7orW0+ABES/koMf2Y+cU6zEhZ1aP7Q9k6DpT9sSw2yvkBExNxqLI
 qduYLt7XS5Bkto6QTjJh0b0Er+CteEqtYvP99HduAugLtBnBuMsF4eB7m2jCn8ErMWRMz7j+GBS
 NT5DMlca7nY/rx1q4=
X-Received: by 2002:a05:600c:e54a:20b0:492:28be:6098 with SMTP id
 5b1f17b1804b1-49266864257mr3421925e9.11.1782357969808; 
 Wed, 24 Jun 2026 20:26:09 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46caa798f43sm8530165f8f.8.2026.06.24.20.26.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 20:26:09 -0700 (PDT)
Message-ID: <6a3c9fd1.6f8d79aa.8a0e0.eda1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 25 Jun 2026 03:26:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782357970; x=1782962770; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XFyp/q4KNrJk4HVb8jcTY8SX7Ze9FdQUUYltRlJrE18=;
 b=OtXQQOsWs+vRFGJCGi3nMQzJNvoi/9F6hg2JmILNwONJAw4VpdMV8SM2wpFBF1qlUC
 2EQbtBT8uYwy3PLz/SRarN6X7NcFrjNK93ZM9xAoh3yYcobHOn4ERk0i8v2ClXjFgZcz
 bXqHLA/ZX/Na89VaadJ27xMtxXyIHKerAgB6QAfY5NdcnNl2oNBXAdKBdGLlDNaiJmYf
 tyuBfXj/npF2uMaMuvZr0m+0ukbhCMAs0sfLoyLeuwjrDLmA/ygRL5vy+mYOKjialqde
 EeX9XMQnRGUu+urHmStccWyQ3GtQ8bgZTsHMDTgnU9oE5vkdIlitVJfLJUeyVStJFhgK
 6sYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OtXQQOsW
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-24
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

Autobuild statistics for 2026-06-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
  2026.02.x  |  1  |  0  |  0  |  1  |
  2026.05.x  |  1  |  1  |  0  |  2  |
    master   | 19  | 58  |  0  | 77  |

Classification of failures by reason for master
-----------------------------------------------

              host-pahole-1.28 | 5 
              host-guile-3.0.9 | 3 
                  ntp-4.2.8p18 | 3 
        edk2-edk2-stable202602 | 2 
  gobject-introspection-1.84.0 | 2 
host-vboot-utils-7dfa482d6a... | 2 
               libepoxy-1.5.10 | 2 
                    olsr-0.9.8 | 2 
                   perl-5.42.2 | 2 
       sp-oops-extract-0.0.7-1 | 2 
amazon-ecr-credential-helpe... | 1 
               bpftrace-0.24.2 | 1 
                   dante-1.4.4 | 1 
             docker-cli-28.3.3 | 1 
 docker-credential-gcr-v2.1.30 | 1 
              erlang-26.2.5.15 | 1 
                     fd-10.3.0 | 1 
                 gnupg2-2.5.20 | 1 
                    grub2-2.14 | 1 
host-am335x-pru-package-5f3... | 1 
       host-gcc-initial-15.2.0 | 1 
                host-gperf-3.3 | 1 
            host-libtool-2.5.4 | 1 
          host-tipidee-0.0.5.1 | 1 
                host-wine-11.0 | 1 
          host-xfsprogs-6.19.0 | 1 
            igd2-for-linux-2.2 | 1 
                   linux-7.1.1 | 1 
               linux-pam-1.7.2 | 1 
                    lua-ev-1.5 | 1 
          lua-lunix-20220331-1 | 1 
           oath-toolkit-2.6.14 | 1 
                 opensc-0.27.1 | 1 
                    opus-1.6.1 | 1 
                  prboom-2.5.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                  readline-8.3 | 1 
rtl8188eu-cca7c28087db740d7... | 1 
                 rtl_433-25.02 | 1 
                   s6-2.13.1.0 | 1 
               sigsum-c-v1.0.0 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/04ac23767fef09caece2aaf5de37bc5f081f6a68 | ORPH
  aarch64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/10929b25fbb933f08752a2c205e5493e49a4580c |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3a4b530ea8263b0d0d4aa2e7b560a49cabcab8b0 | ORPH
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/40e59f2957d4fc21cd2600203dfd776622c7f411 |     
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/1f2c30490a245d7b06357961aad3f0d52fd72b06 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/0fa7e648a001eb372d9df04e9e7896edcda11200 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/85f2fbac0351f8909c7edd4ba1029a4acc0526f0 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/47e7dd18635527d0717bb322bec38cc76fac6d6b |     
  aarch64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/aedea498e633024d7fd26a31052014a6e66c1f49 |     
powerpc64le  |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/78c45afafc9e69bd31a764ae4f57fc042695aab7 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/17d3a1c9dca2728f9445f0842a645bd58cb947eb | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f12c2a533fb6132f8fee0099439d78a3321c3e10 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/a58dd0512cc4d315c672fd21d95ee2fdcbb6751d |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/b909d8b3dab2e037487e9f83ae30893e4fd7f08d |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/aa3023da5d1095cc92711b1bfd8d3ea4e038a0a5 |     
    i686     |         host-gperf-3.3         | NOK | https://autobuild.buildroot.org/results/bdced0adbf07677f9b957aa2984064b095547fbf | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/31fa61a895faf924233f8e4e55e0794bb75e596b |     
    i586     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/580354d3560f404160a5f1dc5cc0a257078b743b |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/172aacc72fb5309a1834a860cd9291823b1b7ef1 |     
    i686     |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/5d6d1bd9fdccb00e73a74baa15bc2a4f61ba56f1 | ORPH
    i586     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ddf77b203d94774746242316fdb79675815df6a2 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/d8d0ccc7c81e0633821884bd5e38b5e4723a471c |     
 microblaze  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ada5b448deda90c687396404e5c82dd7a22bde53 |     
    i586     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/4baae99c79868b9c46a5be5a223a41775f1ca633 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/7cf01011a3c068e3a8bca450882187776936066c |     
    i686     |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/2c47b61b94aaf2179d814feac72de73e638ebb77 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/ec2ed8eb5eaba1c78aaf1afd86d3d837e89359cb |     
   x86_64    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/655210bddf4999d1fe63c0856c46f7a2338aadc6 |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/07305f71e0e228d1977a193b6b5c789bf5940bd5 |     
    hppa     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/ec3bc0d9b89ae6e2235c26d3242c3b8a1d7115ec | ORPH
 microblaze  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b2e9e7c1f615a9d980c25ff52cbc03c4166b0793 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/677402cd453d0d769adf82fd730279120fdb2377 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/3484ea9b2ca1ea98a8dc46dc89a2a241f63c4f30 |     
    i686     |          linux-7.1.1           | NOK | https://autobuild.buildroot.org/results/94af2a4bd10b96813506fb137df253ebb8752b0e | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c9d72a72db29b0d81a5961d575e9f208a8fd67ab | ORPH
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/34c9dd94e35c7cc768da04d22ecbcc84586b0bf0 |     
   x86_64    |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/2063c48b686cfca6fe4ce6479cc1d9b280fd96f9 |     
loongarch64  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/15b483e2d5786eb93712ebd7f5f883c9a8b9879e |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/38323a829e7c7f84f89a4f358ea894488ce999a1 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ca04bcc404e5dd588c25bf9af3c3936503a2d345 |     
  mips64el   |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/147be8cd7d1d2d20b610a02b73249f0db1fe1258 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/ece7c4108f8691b1431a1ad228a10e4ceb712108 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/746d810bdf631ce01b864820a3f4880744f474d1 | ORPH
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/c40748b33aa42d114ba1ca1a961f48fd496fa26d | ORPH
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/089441103450a1d469493e7eeb99ec370fa7a23c |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/1b882abd381152a070e493f8771ef17526282a4a |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/bef8805e77090382effec417af9f753f33d0dbea |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/b1f5a654948a5a8dece3bde2d1575ee2eeaf3dc7 | ORPH
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/489e5cba1974e37fae72f8ef20ba5186a458220b |     
    i686     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/8ae21a5bfb8888060fba331e7f58705790bc87e7 | ORPH
    i686     | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/72d23d195630202a44eab8cfe7873fc25782eb07 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/9f7b6ed3025189cd3b0e599c5c24f3de50af79f7 |     
  mips64el   |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/e319be8eb82e9d1a4b91bd01a1c090e20323bc79 |     
    i686     |        sigsum-c-v1.0.0         | NOK | https://autobuild.buildroot.org/results/43f82aeb321cebfc360b8287946255a3b2916cd9 |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/341d78f6830b11be8c045f12d07221184be09e28 |     
   s390x     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/12dcbb08158c5d5158752317e95d6556bc8f48ac |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/946281125f17dd522bc084fb45f0c4e7623ca60e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9043abebbe51f489d7dd894dbcdc397da07345a1 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

          usb_modeswitch-2.6.2 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/6ab4849add67d5fee630adf20f860c409adca813 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

         libhdhomerun-20210624 | 2 
  gobject-introspection-1.82.0 | 1 
        host-python-lxml-5.3.0 | 1 
              udpcast-20230924 | 1 
  wireguard-tools-1.0.20210914 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c358c1de18c4c16999ce002032fd1a32fbaa058c | ORPH
    arm      |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/782ec3719c054c8d21561665aa63af6654de6020 |     
   mips64    |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/1b785fe4e412aca8cc94f4defa2fe449c3801f8c |     
   mips64    |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/03c7180bb7ee2ff1ae7f85d369e27ac6e3b99c2f |     
    i586     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/37f860f7c4cecb3e06fa989a1edda3e1968a8c62 | ORPH
    i686     |  wireguard-tools-1.0.20210914  | NOK | https://autobuild.buildroot.org/results/9de1a3d9e63f1e264c2eab57f7dcddf2b455cfd5 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

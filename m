Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E896D6CFBD
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 06:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C81B360722;
	Fri, 23 Jan 2026 06:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0dDwC4TWMlP; Fri, 23 Jan 2026 06:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7495560723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769148149;
	bh=hfcOHoJJhK9N0cMbCA+KbnliUH7qq8Z9AOWAWWnefUw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pep8bGsr0k6m8MQ+dUdXQx3YsC/F779ORYncRY/0v9nRppwhGzwW+8sxjsgGGfUI1
	 DxSjJwgrRntsZEf4p4mgKWDHxcoIOSnSA5TLRZD2kukrF7UX1EROdnWn61gKLs4ynX
	 /2XBDYjZFs1rHHp7CuRCz+vHhFkcV3HBxmzdeN3qgoP5APfYkXaMgGo7gSn9qbr0gL
	 5lzbQa3qq/R6IhMDouIY4gQXaWm4DpeJfXWXjzJQ0z//Ox7hEABm0V1/HdSZLWRDOn
	 QiM6YscH0OTWFO/O+WSyAuU+FBGRy5YgcZLvcAilJD12dMob2BBRdi1isE+eEXUwa9
	 kJK/k4gMqddJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7495560723;
	Fri, 23 Jan 2026 06:02:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 113F1A3E
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 06:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8CC382F9B
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 06:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9ThgnOXE1BX for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 06:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AC2B82D17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AC2B82D17
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AC2B82D17
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 06:02:26 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b8714a52072so282696366b.3
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 22:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769148144; x=1769752944;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fk3wDWucI1fPZz4lHBzCBmlJLyL9/6/E69Fb0TyhA4s=;
 b=PNTATAmpYiv811Km+N/yhjx05aaYvYGf2UjhM2+DS6u86ynGsYtcS6BZaOuc4Mi9w9
 +jOr5qxvPcowP19KiE6kly7gty3gK/nCmxGafWKUW+A3SRb8l+eJzuGS61+ydAxh86VU
 83+PMH/GsSI5LJqLW7oWa2CSkAvYvQwj0v7gwkp+fycwXPPkQueg2B0ladCb+xqP6SuP
 NLzUIp0R+Sy3CiET9uwvgnGDicpibHsHV+mCa0Em1wqpb1JnX9H/ELTUD6LbziCyVZtB
 1NdqKGUk5o+H/NM7GgWrThg0y6eumw2qkxRDWRflYjQaJH7rHlX8zMMFFKsR3ajp0uHA
 avfw==
X-Gm-Message-State: AOJu0YzX1XjpRSQ8byzv+tdGXIPDhyyKAuhX6CPpwFKB9lBpy5x56cI5
 xXtlRTgDUZbhhGkfS0PF2FgTwxTURWmXL0dcCksFOkLVU46uIMZuRReqPDlyQQ==
X-Gm-Gg: AZuq6aKkG1U5aE3taeLs7fnJRpnp3rrg8xVNC+PCJCX0V//A/PsXGu/abTshdtD2l7Z
 YmtaajEjTaIxfmzHz2oEbjQ+jLaPzQexrNaJkQQrhBf92pt5yP/EnkH03dMRnLoBTX7Iao4DFHW
 fGz8Q0L1Y2Q1dnmob8f3OlxwnW2OrYy2vil05aNTMAxrLLuk7jd6tbA7zg2EY3TayhEwRiId2zl
 WSWLLzhNn0ARpRyfq46vxhYSt+sjfXV/7Rfy7x8hy8u+aI6pE1bzOPML7p+7y6+UOE07S9/Ua12
 5pTL5zMz/E+2wMsqvY1awq1SAsrv2qNAbjkOT7+DEpnX8Y/Htg3j90InuBsJX+Se+XY0RIdPKV5
 iJtzIqiNN+1p4qj8JXtwvgsKEF6rsDMq6xtvlqZkqBjhYGF+WpS/Y6YgEjy5njnjMSIsVe+HKWU
 NMuTo1Pzek2of4aCR3tg==
X-Received: by 2002:a05:600c:64c6:b0:47e:de23:dd6f with SMTP id
 5b1f17b1804b1-48050d6aebfmr3893475e9.12.1769141838189; 
 Thu, 22 Jan 2026 20:17:18 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d7d2d9csm27625415e9.0.2026.01.22.20.17.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 20:17:17 -0800 (PST)
Message-ID: <6972f64d.050a0220.189013.ee22@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 23 Jan 2026 04:17:17 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769148144; x=1769752944; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Fk3wDWucI1fPZz4lHBzCBmlJLyL9/6/E69Fb0TyhA4s=;
 b=GE03Cpq/5trIh+lhGfCgZmG3CM3eK0jguyCfQrTsY9vKbkQx5+rfvgRuJtQE5OSF94
 eGaSFB69RMoejgj7FUl++d2N5JbJlVXNdfFIRJKgsu1a+LBRvFr6jOvKgox57LUYYa1z
 NVHdCDUX1D1CGwbdFUARZEr3LwVnzfJTIQfmJ0jzNOV8o6jXLPFuYRQykRfWjweFMYsq
 2aP0u4FilcxoLdz7Bsal+3swD5tQ9gV6YDgLZEfDJtDDAvZDjTU5TZqIFmF22G6Plc93
 1kADtID0ybfJnGmx4oIbGbTSkeCYEDZuTgihUTK022A2s5N7c+M3XpaP8iHV7F9d8gl2
 8WUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GE03Cpq/
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-22
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

Autobuild statistics for 2026-01-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 10  |  0  | 15  |
  2025.11.x  |  0  |  1  |  0  |  1  |
    master   | 33  | 66  |  1  | 100 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
                   dash-0.5.13 | 4 
  gobject-introspection-1.84.0 | 3 
               linux-pam-1.6.1 | 3 
             dahdi-linux-3.3.0 | 2 
                 dc3dd-7.2.641 | 2 
                  iozone-3.508 | 2 
                  libsepol-3.9 | 2 
                    mpir-3.0.0 | 2 
                netdata-1.37.1 | 2 
                openssh-10.2p1 | 2 
                 rtl_433-25.02 | 2 
             batman-adv-2025.4 | 1 
             berkeleydb-5.3.28 | 1 
                   botan-3.5.0 | 1 
                  brotli-1.2.0 | 1 
                 coreutils-9.8 | 1 
           crucible-2025.05.28 | 1 
                   dante-1.4.4 | 1 
                 fwupd-efi-1.7 | 1 
gcnano-binaries-7c181cacf89... | 1 
                        gnutls | 1 
host-am335x-pru-package-5f3... | 1 
    host-mender-artifact-4.2.0 | 1 
       host-nodejs-src-22.15.1 | 1 
            igd2-for-linux-2.2 | 1 
libdill-32d0e8b733416208e04... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
     linux-5.10.246-cip66-rt29 | 1 
                  linux-6.18.6 | 1 
                   linux-tools | 1 
                    lua-ev-1.5 | 1 
              mariadb-10.11.15 | 1 
                     mtd-2.2.1 | 1 
                  mupdf-1.23.9 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
                    opus-1.6.1 | 1 
               procps-ng-4.0.5 | 1 
                  sdl2-2.32.10 | 1 
          sphinxbase-5prealpha | 1 
                tpm2-tss-4.1.3 | 1 
uclibc-ng-test-132c6134d691... | 1 
uhttpd-15346de8d3ba42200249... | 1 
ustream-ssl-5a81c108d20e247... | 1 
        wireless_tools-30.pre9 | 1 
               xinetd-2.3.15.4 | 1 
                      xz-5.8.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/496f64fd6ab4344b139245019675975444804692 |     
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/7fc07c05228f39c184084bb1870d018674233449 | ORPH
   x86_64    |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/cb08b6c0e93c6a349e32c273356cf20f4f0fed08 | ORPH
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/135722e1fd779d1868cc944d199a61256cc7baba |     
   sh4eb     |         coreutils-9.8          | NOK | https://autobuild.buildroot.org/results/5ea4f2f5fd7e1a6caa96b03745ae886792dada4a | ORPH
    i586     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/6e85512f8bafbb08369bc50f438bef5f0531370b |     
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/86978044317478d68c75809e4e1873db7b5cb726 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/71042089f577c82feb0143544fa1c28faae0edfe | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/750c65a9a652af509ccd1c9f614a2e40d1a73f51 | ORPH
  mips64el   |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/349c692aeff74fd136477a46bd8ad3b99b0226d9 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/d187b0dd2791b9114d549de24542eb5382ff6f40 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/e52920421fee925ec3505266f4955784e33adf83 |     
  aarch64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/7919b8d3694de6408cb2f72784dc53e01c88f818 |     
    mips     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/987fc4245cbbe744d793962d1393f6018bf7266e | ORPH
  mips64el   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/db2b3da0e5e364b5d164785e9ef794c90e470a88 | ORPH
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/b89dfd266e1240e2bf7f7aecef8ba4a607f4bd27 |     
  aarch64    | gcnano-binaries-7c181cacf89... | NOK | https://autobuild.buildroot.org/results/3c8cf386c62a9a7ba18cb9adbe72654b4b97c0b6 |     
   sh4aeb    |             gnutls             | TIM | https://autobuild.buildroot.org/results/969de8549ed03860aaee48d2238d067a29e88aed |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c70363509b8fe42698d46502bf22d3858ea51e58 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/82e0b523528beb2316dc26438931714ce12a7d71 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2d4ed202adda1e5c826d4fa826f917bef14f050f | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/05593cd36f308c98a19a2beff1a45a8f81908bd4 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/d89946e4f9d7ff4c7514b563391da289afeb20db |     
    arc      |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/fb4857eea04c143d160867140f129056ffaf9f99 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/3e106a67ae75cdd616a1b44dd19ec7bc33c69329 |     
    or1k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/969d7a3ee538388ea7dc51311b57019fc1b513d9 |     
 microblaze  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/5eb9aee29e2ab8653685dff494f48a2f259134f2 |     
microblazeel | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/0e056c93eaf0b1c6f10ac5eaea510c272030daff |     
   mipsel    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/25606f87f4eff03f26d7f453321fc282b2a5668f |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/b93ab79a0b75f25e5bd28b49afe3654ae1733115 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/737c96d5dbf76b329828361416b8ed3a293613ac |     
 microblaze  |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/05320f943c1b5b4211fd27872a7453bc160fd071 | ORPH
    m68k     |          linux-6.18.6          | NOK | https://autobuild.buildroot.org/results/7d30fe402cc590005ccfa008b31107e169877b58 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0f5a2e0b9823ccb22d9b296b2e1952424d635983 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/20ed20353ad5be0b28f8cf159389ee266302d5fa | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/22516f96e7ebed452e97bce3136e6c821fe1e79c | ORPH
  aarch64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c4d08bd1dbaf448d8e2d0c8b252b233c85e92396 | ORPH
    mips     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/499b59e0bc38a3f80ce490c51a49c117c45a93c6 |     
   s390x     |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/be13acb352d6e16910ebeea7245b82df1c71c698 | ORPH
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1732b3730981e0290bddac9b05a812ebe4751f79 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ef160043fb7bdaf2af702009880694c01c4190b5 |     
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/03fd3d121e8be5193e9b27e3040a9d11ca9a8b3d |     
powerpc64le  |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/f4f57f90e5c946dd34fe36eb2fc5ba0ff1e64e46 |     
   xtensa    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/21c883507b3a88e9f8362f945b34057b925ba21c |     
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/18ad9ea2c1e5209e99a343f499841a79a090666e |     
   armeb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/f3daf1856faa3ac1f7e8ef3279ed746a99069f4d |     
   xtensa    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/b5dc0f464ab4b6253067faa03cc7e527a700c34f |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/2546f8b29239e96d2be632cc24aa03bdc9241ec1 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/b0d29af757606cfddfa4b2f0d92386038c1c4111 | ORPH
   armeb     |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/e3aee904c66aec1c219676bed89e5f3f7d9aa022 |     
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/11ec59263cc71826cf317447760b6627585d4b48 | ORPH
loongarch64  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/0c7b3739d110241985764805d73c0cb4143be409 |     
   xtensa    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/2598a736d2635ba9f5fa9f1bb7d69a23519f50eb |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/a3cb94830a6f97abcc5420b9770b5d8a7c041e0a |     
    or1k     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/25c44a7310fa47a16d4753a29f7f1ff647fc9973 |     
   armeb     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/9948ae8ec62682037fca8f3dbc89a527023e9f0f | ORPH
  powerpc    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/78b7c6b71d81a9820dcaee8b2a016d7a6b4d95d6 |     
microblazeel | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/4265357ce0e655f1259588760a43b7ad3b8eff65 | ORPH
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/68e48db02e8880424d6fba21c2eb4a5109055ccf |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/6dfde6320b8da9e6662179d31e4520362f415931 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/ade06b71e5b425e7ef56e8d7191c378307b586ba |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/d4733ee968fe49543f080ce404970a523f221c92 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/60feccc56fa7cd30b6f1eab8da8793024b340ef7 |     
  aarch64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/fcb91ad9aa263c8734725e367225daf119101efc | ORPH
powerpc64le  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/48c9529736da4d90f7a5f1f5b563321dba95b1d9 |     
loongarch64  |        xinetd-2.3.15.4         | NOK | https://autobuild.buildroot.org/results/c14dc5adc82db30a11ce686aabe70fb61842431d |     
  aarch64    |            xz-5.8.1            | NOK | https://autobuild.buildroot.org/results/b0dbae7b2c884f5fef0017755b28932a83921a5a | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

          cloudflared-2025.8.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/767c8fbd48d820cb4820937d99211c40f0b4e8c4 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
           host-libselinux-3.7 | 1 
                libselinux-3.7 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
     linux-5.10.246-cip66-rt29 | 1 
        ltp-testsuite-20250130 | 1 
                 openssh-9.9p2 | 1 
         xlib_libXcursor-1.2.1 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/a565ad18727ba134ca63cac1a26206a52117e122 |     
 microblaze  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/78d006688ce3489c9f971c7c9978fad77a114de1 |     
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/f13a457c2d1b319ae502349c0787b64dc4afd92a |     
    or1k     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/d6adb68be48d34b298a673c1d17485e191ffc525 | ORPH
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/808ba199ce78a970b89961b4a3bedfab993d72e7 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/71ace35b9359073b8199774545b157705ce72747 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bbef2277440965f2149d699d79e23e65658df1c2 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1a3ea2b2f9424182c88d34e69dab8c8ff36a191c |     
   sparc     |     xlib_libXcursor-1.2.1      | NOK | https://autobuild.buildroot.org/results/f33bda19c19dc03793339147919ee417b9e7e61b | ORPH
   mipsel    |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/70b8dbbdcf9ca189f76fcda7a4d42ba05054b24a | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

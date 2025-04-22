Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9F2C369CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 03:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7312F60BDF;
	Tue, 22 Apr 2025 03:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIS4ilsX7E7Z; Tue, 22 Apr 2025 03:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 591EE60BC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 591EE60BC9;
	Tue, 22 Apr 2025 03:19:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4007568
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 03:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26FAB40374
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 03:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtuVmeEIAngd for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 03:19:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA8C840F45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA8C840F45
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA8C840F45
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 03:19:42 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so34575115e9.0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745291981; x=1745896781;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U6jerluwKA6Ty4izmhqnKdGMmaM4Eo59pp3b/de5jeg=;
 b=VFyp8rgG+eT1BvaWmSWRjREi6YFGh9VvXp3LN+uj8+xoE4fYz1SSho0hSZXu+nLk9x
 ZgOXCv3YdW8XKOVUMQiUI4PvnU5IRY0OLEpgIgTRQthctUEZHvJxvFbYljBbo1xQq3Qv
 LGQ0aHmkbtl+yRXVaccuqAJMizs1qnqfCCpsQ/ugKb4e5hdI4clUdbVS5R18G4bIfTKc
 wswC1mF6kfmZNsdRVNG2jcon3fLsa3mhWBWPWYUyRDSH1T6mrFMvFdJXsD3uHBo9H3yq
 OZiiIFZe2SilSFZGiy40N1dzNeML4hu7ap2m3E4v6bNaxFIZ3b05pgzx58EB5Tg1DPHO
 Fs5A==
X-Gm-Message-State: AOJu0Yxy5hH6tM47R6jK0OqS+wOD+1C6MiQYLidioQ2w/zE1mwWuaKpt
 p0yS2rTaHW373RzSGRAzvLgO+rHGL8CE1DFCEKn85SfzCZt51G/FclSrkw==
X-Gm-Gg: ASbGncsz8motrF338xRWZZBnu3f9k+kBKHLqgQdxP0DhOjFmUazeDVs+4ptkarqayi5
 wiyj0Dvva1I77AnHdaSoVs7rSw/Tk8RvAmTiuTrsvaOpUHTIGm5NYx9k1LV7NKau7thnoRzKxtV
 wrUTXj2+ufS2MuO14m5MukqH0DnmfScGB5uA9iVpCZys1PGcioPZdG4oYPWNUeBpimr+gC++X/5
 37WrNY/ycPq84zHR3UbYi07smKhgFzkaAypEEUg4ajDIsmb9hVmFT9wKkH/nJzvaWWlB6hYdpzb
 4U8KxBN/+6zuqVJpGAY89AMmOE145CeBLbCj7vdQ3Lsz
X-Google-Smtp-Source: AGHT+IEeVJquKtarUGl6TiB4Ro6JqcPsa3Vxr0M/U/C4EsfGCv+LXpo81ywL4APRYDzlEIl3qfEi7w==
X-Received: by 2002:a05:600c:c0db:b0:43d:10a:1b90 with SMTP id
 5b1f17b1804b1-44072c7f6fbmr90163985e9.16.1745291980562; 
 Mon, 21 Apr 2025 20:19:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6e0364sm153175975e9.38.2025.04.21.20.19.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 20:19:40 -0700 (PDT)
Message-ID: <68070acc.7b0a0220.253e0.0242@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 22 Apr 2025 03:19:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745291981; x=1745896781; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=U6jerluwKA6Ty4izmhqnKdGMmaM4Eo59pp3b/de5jeg=;
 b=hJBN2fAmJYnWjEhvNILyCr67X9Fd/SPUI+HmIaZFw/Q1Ht4BqjaHLYzhu85sU/WEYD
 M0CyfWZUj3hsi47kfMiCa1LKYure3K0bYBxSALo0sJpqw2kp3WBX6pCqcyXOl0bKJbl5
 xBvbkHI4liudKgJXc0zpayE1tCY0OCwzEzykIlRexRHq54UPBAcs60ksxKCrDEfB2EpX
 JkqRSqp7PP2DDrcEerXiLpCOnjvMtGCWQ8Hk8bVNveznDx9bHPgtpV0TkGm/b2xokcVK
 hrAWBiBVNlZygHqXmRXVhc8mz6CvXQcPEsfiDjmKo9NZX8MeUPr6wMUwDqUerCjDmcON
 uJOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hJBN2fAm
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-21
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

Autobuild statistics for 2025-04-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  1  |  0  |  4  |
  2024.11.x  |  2  |  4  |  0  |  6  |
  2025.02.x  |  3  |  3  |  0  |  6  |
    master   | 11  | 16  |  0  | 27  |

Classification of failures by reason for master
-----------------------------------------------

               catatonit-0.2.1 | 2 
          perl-net-ssleay-1.94 | 2 
                   cvs-1.12.13 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                  iozone-3.506 | 1 
                 libcddb-1.3.2 | 1 
libdill-32d0e8b733416208e04... | 1 
                   ncftp-3.2.9 | 1 
                  ntp-4.2.8p18 | 1 
                nushell-0.96.1 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   pcre2-10.44 | 1 
        s6-linux-utils-2.6.2.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/5ea84ac2044978f61fea63a5a2d59d29750b945e |     
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/5ba6a1dedf95da6afebd931c1b9f741cf3a38684 |     
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/67d5fe4c536c40a8086cff252678de5ed21ae5e7 | ORPH
microblazeel | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/bd8a5fbd8ba6f6c3c85d952b801006fefd656026 |     
  aarch64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/6a0917ef24bd02949623db9cb45e655856eba759 |     
   sparc     |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/0367739c953fd47f3083f1f8c4aef6b98481f927 |     
  riscv32    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/8ce66837dde1d627f87cbcd0886acceacabacc2e |     
    mips     |          ncftp-3.2.9           | NOK | https://autobuild.buildroot.org/results/19238a4f9a37811e89c4c854740c18f4fc024a99 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9a3648e3b539a333bf31ca3b3d325874dbcb8047 |     
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/3c39e4e9afb90175829c5d84bfe2695f641bdcd5 | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/e083c823755540f3e79abb9eb6ed35aff52e526b |     
    sh4a     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/865e55811252bee04838826a8a8595611be41d93 | ORPH
    mips     |          pcre2-10.44           | NOK | https://autobuild.buildroot.org/results/fbd390f8b21caa85347cd270f334264d66bb40ae | ORPH
    m68k     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/56a31501d76c9c6b9204119f6a89f4ba9b6f769a |     
   arceb     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/15182ebee38825999931e5fce7a92081207909d4 |     
    or1k     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/a7975b64fe042ffdde15efe3b4c2dbe26ad48e91 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               ipmitool-1_8_19 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/eefa74b44de1f048d905677762e60978260f407b |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  fwupd-1.9.20 | 1 
              libzenoh-c-1.0.2 | 1 
                   ncftp-3.2.7 | 1 
               openldap-2.5.18 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/09643c54d7a3387f34595fde375ea5c6bf398a64 |     
   x86_64    |        libzenoh-c-1.0.2        | NOK | https://autobuild.buildroot.org/results/53272e418ad1b06ddb7b82d7cf8b58b7f3a20403 |     
   armeb     |          ncftp-3.2.7           | NOK | https://autobuild.buildroot.org/results/51ad7a881bc76b1f88579652ed24c49417eb0924 |     
 microblaze  |        openldap-2.5.18         | NOK | https://autobuild.buildroot.org/results/b1407319a84870e8a051ee3005555295bd0f8074 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                bpftool-v7.1.0 | 1 
               ebtables-2.0.11 | 1 
                  ffmpeg-6.1.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/9b6369789e4cf4444937d9d18a1baf80e9d68519 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/992a7cbea478350f2e23e57fc7d7c9451b63ddee |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/c558368b9534a8ca84ba4bf1659258b17dab139c |     


Gitlab CI results for 2025-04-21
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774023028  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022895  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022888  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022883  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022879  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022872  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022852  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022845  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022765  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022762  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022739  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022738  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022726  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022705  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022661  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022650  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022642  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022639  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022637  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022636  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022635  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022592  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022589  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022579  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022577  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022576  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022555  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022494  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022399  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022361  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022311  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022307  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022298  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022296  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022131  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022128  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022127  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022125  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022122  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022119  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022117  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022115  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022113  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022109  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022108  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022106  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022104  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022102  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022097  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022094  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022091  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022090  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022088  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022086  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022084  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022083  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022080  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022078  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022074  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022071  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022067  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774021952  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774021941  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774021930  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774021912  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774021831  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774021806  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774021801  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774021793  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774021788  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774021781  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9774021762  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

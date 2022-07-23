Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E894C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19AF040AEC;
	Sat, 23 Jul 2022 13:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19AF040AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7C_vKo1uAKyH; Sat, 23 Jul 2022 13:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 433D440576;
	Sat, 23 Jul 2022 13:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 433D440576
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EFBA1BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39EC584A2D
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39EC584A2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UeBNeVcsNmvA for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:04:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4762847FD
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4762847FD
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:04:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m17so9560986wrw.7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5SZwBS7tn/eI9FmZj04P3DYHDNNtv0irVWip7TdR1rQ=;
 b=zz71himIRrCSLXTzMQnw3aycAHKPNbN9GdGeHNUymCwfJGv/G9keMvQ3C+J1Sfsx8P
 ogrdMRu3PA3kj1+ul3WZuoxgmL0TEtT7jPNmCbKbPXRQuqGxdU7YG2Ji6sYQiu28eYID
 wEPtywXe5vnsFSQmhbrV64qc6vGebJlk2mQnms7ep3ueumPZ9PcSx1ltWCLtTTZO2Sf9
 gcGI2fCK9EiyEQjrw5uHFphsIlJAPFmQae1IcrYFD50sAgn+3NSpm1IWEMlqcuBM3v19
 tPZpuWDsPuH4N4VJhWtAiJgE5e1xSpu2rdMDw4EWFYPRo6zvXQr9H4fEvM/4sLjMmU/u
 z5HA==
X-Gm-Message-State: AJIora8Y+OAsj3Y4xL5dzoRgN67TPXjpkOyASOmlQCLpY4YeaimVK10I
 6bd9Q9B+5SpPoNdaRmLTBtASKIiW5Q8=
X-Google-Smtp-Source: AGRyM1v4EecvapwOYZuwUdbcj37abwXeWH0XiWa1bqy3tXKjkYauKJmUo8/0svYc6n93jYhI7BOn8w==
X-Received: by 2002:a5d:47ca:0:b0:21e:813f:e8d3 with SMTP id
 o10-20020a5d47ca000000b0021e813fe8d3mr206488wrc.416.1658581479786; 
 Sat, 23 Jul 2022 06:04:39 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8acf:5600:bc2c:46eb:561c:827])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000024900b0021d746d4820sm6992218wrz.37.2022.07.23.06.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 06:04:39 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 15:04:38 +0200
Message-Id: <cover.1658581474.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5SZwBS7tn/eI9FmZj04P3DYHDNNtv0irVWip7TdR1rQ=;
 b=GBvyIsq8uJq+XVwVuSJzlKeXXJlfWGQndy+yanCP8KYvDw0uBs08FOrv4Iu5R+tRiL
 nNBLtZeegTdwoGzC3s7AlvBlAr3B4YRV1HqCyNBqUe5t8HK0SWuSzlVlGJtpda1PMQ8d
 2y0ddYMaaZ12yomrma7R6NXe4VhWkb53Wf1T6wCd0ahUQ6ueiYgiXIPglqGDrfbV7DlF
 KjSH8KGOUpKJcq40nR0jg/6N2OrFQjDnsokNnQ1c6Kzd9ywafNnqAOTB/krV5kNtHJXD
 yf5SjCgdx07HLWLipEefdDHSfrSoAvZ0KeEWpVMGiVlknS6dtpvjI7g/v31loY0ylrUo
 iwwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GBvyIsq8
Subject: [Buildroot] [PATCH 0/3] package/python: allow building without
 python on the host (branch yem/python)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This small series fixes #14911: building python3 requires host-python3,
which itself requires that the host already has a python interpreter.

With a little cleanup patch, new runtime tests, and a nice patch from
Vincent, we can now drop the requirement on python being available on
the host. It also drop one of our patch and some crazy and fragile hacks
to regenerate python internals.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Vincent Fazio (1):
      package/python3: use the provided pyc compiler

Yann E. MORIN (2):
      support/testing: drop legacy python2 code
      support/testing: introduce py-only and py-pyc tests

 ...h => 0011-Add-an-option-to-disable-pydoc.patch} |   0
 ...0011-Add-importlib-fix-for-PEP-3147-issue.patch | 105 ---------------------
 ...=> 0012-Add-an-option-to-disable-lib2to3.patch} |   0
 ...Add-option-to-disable-the-sqlite3-module.patch} |   0
 ...4-Add-an-option-to-disable-the-tk-module.patch} |   0
 ...d-an-option-to-disable-the-curses-module.patch} |   0
 ...h => 0016-Add-an-option-to-disable-expat.patch} |   0
 ...0017-Add-an-option-to-disable-CJK-codecs.patch} |   0
 ...tch => 0018-Add-an-option-to-disable-NIS.patch} |   0
 ...019-Add-an-option-to-disable-unicodedata.patch} |   0
 ...ch => 0020-Add-an-option-to-disable-IDLE.patch} |   0
 ...=> 0021-Add-an-option-to-disable-decimal.patch} |   0
 ...option-to-disable-the-ossaudiodev-module.patch} |   0
 ...Add-an-option-to-disable-openssl-support.patch} |   0
 ...an-option-to-disable-the-readline-module.patch} |   0
 ...ons-to-disable-zlib-bzip2-and-xz-modules.patch} |   0
 ...6-python-config.sh-don-t-reassign-prefix.patch} |   0
 ...0027-Fix-cross-compiling-the-uuid-module.patch} |   0
 ...028-Add-an-option-to-disable-uuid-module.patch} |   0
 ...0029-fix-building-on-older-distributions.patch} |   0
 ...-fixup-CC-print-multiarch-output-for-mus.patch} |   0
 ...-option-to-disable-the-berkeleydb-module.patch} |   0
 ...libc-ng-doesn-t-set-errno-when-encryptio.patch} |   0
 package/python3/python3.mk                         |  47 +--------
 support/scripts/pycompile.py                       |  91 ------------------
 support/testing/tests/package/test_python.py       |  34 ++++++-
 26 files changed, 35 insertions(+), 242 deletions(-)
 rename package/python3/{0012-Add-an-option-to-disable-pydoc.patch => 0011-Add-an-option-to-disable-pydoc.patch} (100%)
 delete mode 100644 package/python3/0011-Add-importlib-fix-for-PEP-3147-issue.patch
 rename package/python3/{0013-Add-an-option-to-disable-lib2to3.patch => 0012-Add-an-option-to-disable-lib2to3.patch} (100%)
 rename package/python3/{0014-Add-option-to-disable-the-sqlite3-module.patch => 0013-Add-option-to-disable-the-sqlite3-module.patch} (100%)
 rename package/python3/{0015-Add-an-option-to-disable-the-tk-module.patch => 0014-Add-an-option-to-disable-the-tk-module.patch} (100%)
 rename package/python3/{0016-Add-an-option-to-disable-the-curses-module.patch => 0015-Add-an-option-to-disable-the-curses-module.patch} (100%)
 rename package/python3/{0017-Add-an-option-to-disable-expat.patch => 0016-Add-an-option-to-disable-expat.patch} (100%)
 rename package/python3/{0018-Add-an-option-to-disable-CJK-codecs.patch => 0017-Add-an-option-to-disable-CJK-codecs.patch} (100%)
 rename package/python3/{0019-Add-an-option-to-disable-NIS.patch => 0018-Add-an-option-to-disable-NIS.patch} (100%)
 rename package/python3/{0020-Add-an-option-to-disable-unicodedata.patch => 0019-Add-an-option-to-disable-unicodedata.patch} (100%)
 rename package/python3/{0021-Add-an-option-to-disable-IDLE.patch => 0020-Add-an-option-to-disable-IDLE.patch} (100%)
 rename package/python3/{0022-Add-an-option-to-disable-decimal.patch => 0021-Add-an-option-to-disable-decimal.patch} (100%)
 rename package/python3/{0023-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0022-Add-an-option-to-disable-the-ossaudiodev-module.patch} (100%)
 rename package/python3/{0024-Add-an-option-to-disable-openssl-support.patch => 0023-Add-an-option-to-disable-openssl-support.patch} (100%)
 rename package/python3/{0025-Add-an-option-to-disable-the-readline-module.patch => 0024-Add-an-option-to-disable-the-readline-module.patch} (100%)
 rename package/python3/{0026-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch => 0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (100%)
 rename package/python3/{0027-python-config.sh-don-t-reassign-prefix.patch => 0026-python-config.sh-don-t-reassign-prefix.patch} (100%)
 rename package/python3/{0028-Fix-cross-compiling-the-uuid-module.patch => 0027-Fix-cross-compiling-the-uuid-module.patch} (100%)
 rename package/python3/{0029-Add-an-option-to-disable-uuid-module.patch => 0028-Add-an-option-to-disable-uuid-module.patch} (100%)
 rename package/python3/{0030-fix-building-on-older-distributions.patch => 0029-fix-building-on-older-distributions.patch} (100%)
 rename package/python3/{0031-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0030-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (100%)
 rename package/python3/{0032-Add-an-option-to-disable-the-berkeleydb-module.patch => 0031-Add-an-option-to-disable-the-berkeleydb-module.patch} (100%)
 rename package/python3/{0033-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
 delete mode 100644 support/scripts/pycompile.py

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

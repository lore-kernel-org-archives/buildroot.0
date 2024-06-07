Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A69C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5084542834;
	Fri,  7 Jun 2024 17:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhC7_lE08M8e; Fri,  7 Jun 2024 17:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7EED42816
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7EED42816;
	Fri,  7 Jun 2024 17:06:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 114041BF95D
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9108404C4
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMBUmeGUzJUq for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74FA44004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74FA44004A
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74FA44004A
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:02 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5295e488248so2857483e87.2
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779961; x=1718384761;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkC7y0k1J5q5U3tM8rhU+S1H/shWiZJuTruen7iOHBo=;
 b=ehnRElczbCQKEAc0byYqifPoaRT3hGWHFYkZHJa3p1jQ7BFMe3M6taGUzdaqBzGpLp
 sE1XL2/EOSRkAWblWIzDZ0HuHTjCsMKDOYTXQ7nPxU4FsUOsseQvHj57m81ZDt1DigKV
 SJP7ERbECJZFNMHwo6b0KCU6mSjoeNG3w1j0NXZLXyuer6z2JTO4VGkoeQnK8Bfi+RgC
 5EBrcqh7vZ20HONcuXEhlFSvmHirz3jT08KRcvxvVtdZZ7F0Hh/rB1pPtnfK40syYAC9
 LKCWuKPoj7OFAUl39leK2ci+tlMhyXsw0IfzB2PIm0pY16Be+qL/DQNBt87dGmzdENuv
 /YXw==
X-Gm-Message-State: AOJu0YxG5AdyGIKozbaKr1mBnp0BbXgAJWn0vkKnZZ5IUD1RH88dvZ/N
 N09vTR3k8yk6ly06KLfkjW/9j9db5SZRkcrxFN1p4ukuZEEttTwjQJCCHg==
X-Google-Smtp-Source: AGHT+IH9qcQ4/MZ1taXzMel+WX0KqV6hXMyc4uJEi3ZIMM9MAo/sumOmr9WlIwnKfeNV6XS2TRudgA==
X-Received: by 2002:a05:6512:3f14:b0:52b:7d16:2c7a with SMTP id
 2adb3069b0e04-52bb9f66473mr2779425e87.3.1717779960444; 
 Fri, 07 Jun 2024 10:06:00 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2c6900sm57997125e9.36.2024.06.07.10.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:00 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:59 +0200
Message-ID: <cover.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779961; x=1718384761; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=QkC7y0k1J5q5U3tM8rhU+S1H/shWiZJuTruen7iOHBo=;
 b=SsWrADjG+zPhJzNgoWyh6nJ0bvWQ+RtUaJsg6Yg85BeyqEwS4PyOjHSxIh5j99SIJ/
 PB4Yw9p4hXtkt0Hheu2V5lZAVXPM5jG8i7bLgIfU6M92xamw/iYKeGLO3GKbwGTDneP5
 JQlvgV1eWhKcLyYFgyIkRov9skcsAeFBdngpvQe15RzdBepKU6Xsj+rYI+LsD0zUZq6B
 IJyWLMALQ9SaO/suOurRjPiLCKm1NZDBM7Wqid7JMdYRHNc2ksw/zjxVJ5ui/z2fG3au
 ZCh+Xbh4XtkxnFTBl+gw8JGspm0rh+cKVvkbjxRVqBLBzD+Sbh+wSHbOp58SQi7vKZ1i
 6UaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SsWrADjG
Subject: [Buildroot] [PATCH 00/20 v2] support/download: allow downloading
 unlocked cargo packages (branch yem/cargo-unchained)
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

Some maintainers refuse to commit a Cargo.lock in their repository [0],
so there are cargo packages that are unlocked.

However, we currently require that a Cargo.lock be present: we call
"cargo venodor --locked"; if there is no Cargo.lock, cargo fails.

This series adds support for downloading unlocked cargo packages; the
series is articulated in three steps:

 1. preparatory cleanups (shelcheck, readability...)

 2. extend the download infra to pass arbitrary options to the
    post-process helpers; use that to pass the path of the manifest
    instead of using an environment variable

 3. add support for unlocked cargo packages by passing a new option to
    the cargo post-process helper; add documentation and check-package.

 4. (off-by-one error) add an RFC-style package to demonstrate the
    unlocked cargo package.

Unlocked packages can be handled in two ways: totally unlocked, in which
case they are not reproducible, or by providing a Cargo.lock in the
Buildroot package directory, in which case it is reproducible, but there
is a little bit more complexity to it, so this is implemented separately
in case it is deemed too heavy-weight.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (20):
      package/pkg-download: symplify calling parameters
      package/pkg-generic: split long, unreadable DOWNLOAD line
      utils/check-package: add option to run the test-suite
      utils/checkpackagelib: instruct shellcheck to follow included files
      support/download/dl-wrapper: fix shellcheck errors
      support/download/cargo-post-process: fix shellcheck
      support/download: move tracing functions to helpers
      support/download: pass post-process options to post-process helper
      support/download: accept manifest path as a post-process option
      pakcage/pkg-cargo: use post-process opts to pass manifest path
      package/pkg-python: use post-process opts to pass Cargo manifest path
      package/python-bcrypt: use post-process opts to pass Cargo manifest path
      support/download: no longer support BR_CARGO_MANIFEST_PATH in cargo post-process
      docs/manual: rephrase end of vendoring section
      package/pkg-cargo: add support for unlocked packages
      utils/checkpackagelib: add test for default _CARGO_LOCKED
      RFC: package/anvil: new package
      package/pkg-utils: accept pacakge-specific archive format version
      package/pkg-cargo: allow unlocked packages to provide local Cargo.lock
      RFC: package/anvil: add local Cargo.lock

 .checkpackageignore                    |    2 -
 docs/manual/adding-packages-cargo.adoc |   34 +-
 package/Config.in                      |    1 +
 package/anvil/Cargo.lock               | 3464 ++++++++++++++++++++++++++++++++
 package/anvil/Config.in                |   20 +
 package/anvil/anvil.hash               |    2 +
 package/anvil/anvil.mk                 |   31 +
 package/pkg-cargo.mk                   |   31 +-
 package/pkg-download.mk                |   33 +-
 package/pkg-generic.mk                 |   12 +-
 package/pkg-python.mk                  |    6 +-
 package/pkg-utils.mk                   |    3 +-
 package/python-bcrypt/python-bcrypt.mk |    5 +-
 support/download/cargo-post-process    |   62 +-
 support/download/dl-wrapper            |   32 +-
 support/download/helpers               |    4 +
 utils/check-package                    |   10 +
 utils/checkpackagelib/lib_mk.py        |    8 +
 utils/checkpackagelib/readme.txt       |    1 +
 utils/checkpackagelib/test_lib_mk.py   |   18 +
 utils/checkpackagelib/tool.py          |    2 +-
 21 files changed, 3728 insertions(+), 53 deletions(-)
 create mode 100644 package/anvil/Cargo.lock
 create mode 100644 package/anvil/Config.in
 create mode 100644 package/anvil/anvil.hash
 create mode 100644 package/anvil/anvil.mk

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

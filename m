Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52522C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CDD5820BE;
	Mon, 14 Jul 2025 20:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXSYie9-88II; Mon, 14 Jul 2025 20:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81500820AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81500820AA;
	Mon, 14 Jul 2025 20:26:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D83D5DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE1A7606CA;
 Mon, 14 Jul 2025 20:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMzEvqmM0ycd; Mon, 14 Jul 2025 20:26:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 01477606C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01477606C4
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01477606C4
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so32284415e9.1
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524767; x=1753129567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPMsxAuvJUZ+jwwPmRgrS6bBNW2WBeiHc3zeaK/DLxs=;
 b=SvHTA7V+lan/LVMwCRqhTiXD3Q9WY6xb/RInakmJx+bdpbwpEWBkYDTqD73ULQRzk/
 nu1puAzf7q++hz4LkYSKRtobFonBbu3IVYeQDVvx3GB8tdI0lkjHyUHmeyva8hiu1J3j
 i8jZZUZ7b9xnYFhYIAchKI+LaXmzLurE2oGKu/EjPvyDwtwKIn9NF5ed8+RaeRsBVdYW
 TW3eaiNVdXvrHmjIFKTQ5ZatMiiKxoyaWv3h/WBai4dVXJRlnmYkTonoZwhfc+62hrHR
 TQu74920bylWCSEZeZmQLK7xeEWdaHkghlFQ5nqBZYeEOCOPaao7RFI8iGo6hDkCoJVe
 VLfA==
X-Gm-Message-State: AOJu0YyIwQQZ8qTZlVPoGydZUGuNuPEFYgOEvWzsnK7eslK/m+YYd8a5
 NRueNJ61hpVtBxL+Zqid6WhziyxMyJbUjd7aMXnoKg47om8MI6w8CO9z+6+q8Q==
X-Gm-Gg: ASbGnctFJffTlgQ0asnhs6k/f7PQLVGtAy+c0W7oXq2r1aQhYFJtMH12se7adGt6FPn
 MRCf0fspMdxrNEhQahRBq0wjjz8U45jAA2WRDI881BPllRMClGHFg0XqGIHKN+l7UxJOHkI2UF9
 juKee4i5sqywoeGyJO2iMfzP8ZuscNeST1HeWlnZOVzoIx/oGGTnoh5xgD3uhkGr7HlvT2WOk/q
 x493NPCmF8q+2265RBW8Gv9Xo2+2SPeSvoOF07RpwAN0aolI7uQqgBA90ho6iwaKRvWRJ+2jxMt
 rm2bWfiyi98FYQs0+0xskqelfHWfA2O9aHrIvSARvg0u2ToNdzvxhyzkeoRBQt23uY2y+LEk7Lt
 Bx/G0m36BzyGF23s3lXrTOVVLu0thSlCK
X-Google-Smtp-Source: AGHT+IFZmKhQMzptod7bPH/+sY6kiSXGr3dx95f7tm922bj6N6ADG9liaoWzjF0jkcL1OXc4Ld6tgQ==
X-Received: by 2002:a05:600c:5304:b0:456:1bae:5478 with SMTP id
 5b1f17b1804b1-4561bae5841mr48274575e9.2.1752524766653; 
 Mon, 14 Jul 2025 13:26:06 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45626cdf83bsm886165e9.3.2025.07.14.13.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 22:26:05 +0200
Message-ID: <cover.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524767; x=1753129567; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=sPMsxAuvJUZ+jwwPmRgrS6bBNW2WBeiHc3zeaK/DLxs=;
 b=KdO/Se1nMNhpI6ZspUGQzMGR4Mn7RcNOF0JHPgsJAoJoQzLn25QrdrdrXfFNar5PjK
 UCKsZarwsWYFSOj8AjIHvcjG16AN1l2w5pnpLzOEBGAIQG5jW9L0TaoBoaZfXdhm4QHG
 8JXDt0LSHUdkcyqseHUeqnt9xwNseSS5gaVOq3aW0KUHLjzjoCL4noR2iPV8tbcVHWOW
 y+1s6uibyHM77/sYiEP7lHFffbYS5f9X3OwUOYF0fkg47teLNIkdVDWL7zWTIhpOAG5M
 1XuenqYcNHTVWSpv+3q1RUJ3E7BmetQriEDSoWXg2mfbml79vF2M1gqwwH5D5nvEyIkA
 60RA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KdO/Se1n
Subject: [Buildroot] [PATCH 00/13] package: bump version for some
 container-related packages (branch yem/bumps)
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series bumps the versions for a bunch of packages related to
managing containers.

There is no runtime test to exercise individual packages; doing so
would be a huge undertaking, especially for the various backends for
docker. Instead, we just make sure that higher-level packages, like
docker-compose, has enough variants to cover the various vcase, like was
done for podman; in the ocker case, only a crun vs runc combo is tested
for now, with further combinations to be added by interesting parties.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (13):
      support/testing: add a crun-based runtime test for docker-compoe
      package/{aardvark-dns,netavark}: bump to versions 1.15.x
      package/amazon-ecr-credential-helper: bump to version 0.10.1
      package/crun: bump to version 1.22
      package/docker-cli: bump to version 28.3.2
      package/docker-cli-buildx: bump to version 0.25.0
      package/docker-compose: bump to version 2.38.2
      package/docker-credentials-gcr: bump to version 2.1.30
      package/docker-engine: bump to version 28.3.2
      package/passt: bumpt to version 2025.06.11
      package/podman: bump to version 5.5.2
      package/runc: bump to version 1.3.0
      package/slirp4metms: bump to version 1.3.3

 package/aardvark-dns/aardvark-dns.hash                 |  2 +-
 package/aardvark-dns/aardvark-dns.mk                   |  2 +-
 .../amazon-ecr-credential-helper.hash                  |  2 +-
 .../amazon-ecr-credential-helper.mk                    |  2 +-
 package/crun/crun.hash                                 |  2 +-
 package/crun/crun.mk                                   |  2 +-
 package/docker-cli-buildx/docker-cli-buildx.hash       |  2 +-
 package/docker-cli-buildx/docker-cli-buildx.mk         |  2 +-
 package/docker-cli/docker-cli.hash                     |  2 +-
 package/docker-cli/docker-cli.mk                       |  2 +-
 package/docker-compose/docker-compose.hash             |  2 +-
 package/docker-compose/docker-compose.mk               |  2 +-
 .../docker-credential-gcr/docker-credential-gcr.hash   |  2 +-
 package/docker-credential-gcr/docker-credential-gcr.mk |  2 +-
 package/docker-engine/docker-engine.hash               |  2 +-
 package/docker-engine/docker-engine.mk                 |  3 ++-
 package/netavark/netavark.hash                         |  2 +-
 package/netavark/netavark.mk                           |  2 +-
 package/passt/passt.hash                               |  2 +-
 package/passt/passt.mk                                 |  2 +-
 package/podman/podman.hash                             |  2 +-
 package/podman/podman.mk                               |  2 +-
 package/runc/runc.hash                                 |  2 +-
 package/runc/runc.mk                                   |  2 +-
 package/slirp4netns/slirp4netns.hash                   |  2 +-
 package/slirp4netns/slirp4netns.mk                     |  2 +-
 support/testing/tests/package/test_docker_compose.py   | 18 ++++++++++++++++--
 27 files changed, 43 insertions(+), 28 deletions(-)

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

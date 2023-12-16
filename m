Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97556C46CCD
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 16:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCDBD4175A;
	Sat, 16 Dec 2023 16:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCDBD4175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbBq3VYKKVKG; Sat, 16 Dec 2023 16:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10BCC41761;
	Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10BCC41761
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19B141BF28A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2AB440146
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2AB440146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PKNKIP1GREu for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 16:10:03 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E559400B8
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 16:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E559400B8
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c2bb872e2so18675995e9.3
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 08:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702743001; x=1703347801;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b1PrBzGCAzj95zgJ1ecuiE5qe9pO9ci7keutJEePMfg=;
 b=VA9XaPk463J0jQfoYSrrF5Cfg5N1CGsgfPRIkQWl2IVGTVr5xeRfa6NFK4d5JF/2Vf
 XUeCg4fdsNalXu2hj+plrLF6Vl7BM5mqeln4h9JD1169BTUH+v4yPBDXabeL5IsNVzpd
 9eZ+HgqsX/gkXucucicAjg477hcD24VTTn2nyxTSegJWNxsKK7B8RQ6UNFZ4cihntfXJ
 B1/bDUm+51NbjZVvkiKpx1ATA28V985h4kYqd2yhcubZ6SYUCWuGml01acFF5a7iSWQ5
 zugJeAfXOy7kRL7ADyKPjOhyLQeeg1xXw+8nETrYE2Of+UmKqeG6eG9BhOECfciHj8yJ
 bqjg==
X-Gm-Message-State: AOJu0YzOi4CJOk7L93T0yKnoPXS4zc2HJ42UEOxuhFAGe4cgIs6iv1Ik
 YTZ60BwinYRx0szcFKaNKdpr4SstXLM=
X-Google-Smtp-Source: AGHT+IFQ2eP2qakPU+JXUkieg8EzIZbcxlZlSYgDzxVhHx7wb7pbrzL2Y0UB2CP//+9yZzmvs+TbQA==
X-Received: by 2002:a05:600c:ac6:b0:40c:310b:b694 with SMTP id
 c6-20020a05600c0ac600b0040c310bb694mr3054159wmr.333.1702743001061; 
 Sat, 16 Dec 2023 08:10:01 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a5d4bd1000000b00336607f6630sm997263wrt.47.2023.12.16.08.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 08:10:00 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 17:10:00 +0100
Message-ID: <cover.1702742998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702743001; x=1703347801; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=b1PrBzGCAzj95zgJ1ecuiE5qe9pO9ci7keutJEePMfg=;
 b=QGoTYRQ7rnjD/KtPTvashnys2A5XGcoggKN8ggjHKknZ+LzrRb7sJxFmj4dJeIhGQV
 UyavJEaJTD2mFnaL8ZiBfrspoxY6tBjk9XKHkVHOJgzmtB0B+u0L96xkEGpKt0GwmTmA
 1xpWakKRepKZOAU5rRJYRriglepM1g71Aq0ylQqWNfLhK2xak6C4YzJbeoSYYCdFCljU
 KbA50WKGayL2BCAZwqea3DZspuiYrvk+ZfP/qtZpK0IFR06PwWRr7TSFy5e7Is+2pEpw
 YnEbo7inBAJlHQeZ/8Ps4LPUEqhKOliooB3GrW6b1iQUpJzFc60XVyOZN8XdC2fs3gl+
 H5qA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QGoTYRQ7
Subject: [Buildroot] [PATCH 0/9] support/docker: improve and extend our
 docker image (branch yem/dockers)
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series attempts to improve our docker image, to fulfill a few
goals:

  - provide a minimalist, basic image with only the strictly required
    set of packages, so that it is easy to test that a package does not
    have a hidden dependency on tools provided by the distribution (e.g.
    does not require a python interpreter);

  - provide an image that can be used in the CI to run all our tooling:
    check-package, run-time tests, etc...

  - provide an image that users can run to have a known-working,
    reference environment without modifying their host distribution
    (when they can't or don't want to);

  - provide a set of similar images for various mainstream
    distributions, that can be used to investigate build issues on those
    distributions.

Regards,
Yann E. MORIN.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (9):
      doc/manual: fixup ordered lists
      support/dependencies: make git a mandatory dependency
      support/docker: retry even more
      support/docker: allow the br-user to become root
      support/docker: introduce per-distribution sub-directory
      support/docker: add script to generate docker images
      support/docker: split base image into three
      docs/manual: add section about docker images
      support/docker: add a Fedora-38-based image

 docs/manual/adding-packages-directory.adoc         | 14 +++----
 docs/manual/adding-packages-gettext.adoc           |  6 +--
 docs/manual/customize-quick-guide.adoc             | 28 ++++++-------
 docs/manual/prerequisite.adoc                      | 45 ++++++++++++++++++++-
 package/pkg-generic.mk                             |  8 ----
 support/dependencies/dependencies.sh               |  2 +-
 support/docker/build-all                           | 32 +++++++++++++++
 .../docker/{ => debian-bullseye.base}/Dockerfile   | 27 ++-----------
 .../{ => debian-bullseye.base}/apt-sources.list    |  0
 support/docker/debian-bullseye.ci/Dockerfile       | 43 ++++++++++++++++++++
 support/docker/debian-bullseye.user/Dockerfile     | 32 +++++++++++++++
 support/docker/fedora-38.base/Dockerfile           | 43 ++++++++++++++++++++
 support/docker/fedora-38.ci/Dockerfile             | 47 ++++++++++++++++++++++
 support/docker/fedora-38.user/Dockerfile           | 35 ++++++++++++++++
 14 files changed, 305 insertions(+), 57 deletions(-)
 create mode 100755 support/docker/build-all
 rename support/docker/{ => debian-bullseye.base}/Dockerfile (61%)
 rename support/docker/{ => debian-bullseye.base}/apt-sources.list (100%)
 create mode 100644 support/docker/debian-bullseye.ci/Dockerfile
 create mode 100644 support/docker/debian-bullseye.user/Dockerfile
 create mode 100644 support/docker/fedora-38.base/Dockerfile
 create mode 100644 support/docker/fedora-38.ci/Dockerfile
 create mode 100644 support/docker/fedora-38.user/Dockerfile

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

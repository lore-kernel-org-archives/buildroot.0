Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB12C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:22:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E633C60F3A
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E633C60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B797C81842;
	Mon, 11 Oct 2021 21:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHoKzLlUFWAn; Mon, 11 Oct 2021 21:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29B8681839;
	Mon, 11 Oct 2021 21:22:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F9AE1BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E9BB404DA
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zeKh_7Wv5DXT for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:21:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6CFC404CB
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:21:43 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 s4-20020a4aad44000000b002b6aa5b6999so4223577oon.2
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBCTZM9OCqBdozXFWBub+Bf2CTKPXCLQWFwOno/oKZA=;
 b=pKtqwZOU2aulPLCVHFt6gEe+8XgpygJ8W9keRKiOt+j6mPaFA+7xGORkC4F/VMpDz0
 2i8uaAkSQiQBAvWvCXcy1ICbfrlSJjPGoKGdbqH2Eukv0biRj3yNhO06ACe6VvYKa3TG
 mjfkGjAbGaoW+ZxTIOOs+q3s0Ce/FjamVByQ1mS0Sez8D2vZZlC7OXA9SBwcHgjqlDBh
 aXfKR4ArPSqX6bWuyBXv6X/NxmDYUAhw2phBeNXbHMdU7JsjBWLoSTkQRM4unLeXgLdU
 3i92bWgQ44gXBqoaJRLyUkftjGuwjrvP3bklDBYT8lsQVTOqwWBfCcFetE0ndALDyra6
 jD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBCTZM9OCqBdozXFWBub+Bf2CTKPXCLQWFwOno/oKZA=;
 b=3NHnZqEvuh4QSLyRyW/lSQ1gz+1BCzhaK3LUlPClSJEgK+upJKYS8B1L1pYXm7b/ix
 GeYNsz5n9YFvh8CM8IWqOfzpbHLVwJXA6Wd+chANwqG/HxMOe8aCQzWUvKL+OwqfAbAN
 0Nvc74K6JoyRkXzhGEVxLbsap/xRZQgxvcTn603qrDEayY+AljGedsDo2tZtqGhSpAiq
 69Jz5bQ6Eop542ei8TIbjsadqgxb38vYzFlSEeffKtII39bpAh/Udx7MeBkMFD+YObvo
 9949NNrh54R/O3ykHkgScVxG863qMD916wnuhjeFW5iDFIc7nJ3sY6JSEIH3EECBpI7J
 48Rw==
X-Gm-Message-State: AOAM530u4xfx0phx8koRf0VuoqULFFEQUlKS4f8t8Q+lJlS5skOnBDYG
 z5MGi5FCiN9Wzf7ggzUrLlZvBFljmbntyL6I
X-Google-Smtp-Source: ABdhPJxw/mGbhYU3hy388hKtyX7bjeFkNMmQ5kUKGxANG2EEiCAdOWJxPPMiYww6sWbrPM8NJl8jWw==
X-Received: by 2002:a4a:c18d:: with SMTP id w13mr20942694oop.15.1633987302719; 
 Mon, 11 Oct 2021 14:21:42 -0700 (PDT)
Received: from localhost ([189.174.209.191])
 by smtp.gmail.com with UTF8SMTPSA id e29sm1770588oow.1.2021.10.11.14.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:21:42 -0700 (PDT)
From: Gleb Mazovetskiy <glex.spb@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 22:21:23 +0100
Message-Id: <20211011212125.402086-1-glex.spb@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011210241.396390-1-glex.spb@gmail.com>
References: <20211011210241.396390-1-glex.spb@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 0/2] package: add smpq and StormLib
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SMPQ is a utility for working with Blizzard MPQ archives and StormLib is
the library for doing this that it depends on.

SMPQ/StormLib is a runtime and/or build-time dependency of several
source ports / reimplementations of Blizzard games, such as DevilutionX.

These packages are already available in other distros, such as Debian.

Changes v3 -> v4 (Suggested by Yann E. MORIN):

  - Split into two patches: one per package.

Changes v2 -> v3:

  - Added missing patch files.

Changes v1 -> v2 (Suggested by Yann E. MORIN):

  - Converted sed substitutions to patch files.
  - Re-ordered mk variables per the suggested order.

Gleb Mazovetskiy (2):
  package: add stormlib
  package: add smpq

 package/Config.in                             |  2 +
 .../smpq/0001-CMake-Set-language-to-C.patch   | 29 +++++++++++++++
 .../0002-CMake-Disable-version-check.patch    | 32 ++++++++++++++++
 ...0003-CMake-Disable-manual-generation.patch | 37 +++++++++++++++++++
 package/smpq/Config.in                        | 11 ++++++
 package/smpq/smpq.hash                        |  3 ++
 package/smpq/smpq.mk                          | 19 ++++++++++
 package/stormlib/Config.in                    |  8 ++++
 package/stormlib/stormlib.hash                |  3 ++
 package/stormlib/stormlib.mk                  | 16 ++++++++
 10 files changed, 160 insertions(+)
 create mode 100644 package/smpq/0001-CMake-Set-language-to-C.patch
 create mode 100644 package/smpq/0002-CMake-Disable-version-check.patch
 create mode 100644 package/smpq/0003-CMake-Disable-manual-generation.patch
 create mode 100644 package/smpq/Config.in
 create mode 100644 package/smpq/smpq.hash
 create mode 100644 package/smpq/smpq.mk
 create mode 100644 package/stormlib/Config.in
 create mode 100644 package/stormlib/stormlib.hash
 create mode 100644 package/stormlib/stormlib.mk

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

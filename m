Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5295EE77199
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 09:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA6DE80964;
	Tue,  7 Jan 2025 09:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwnBnuimYEKH; Tue,  7 Jan 2025 09:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FAA680C45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FAA680C45;
	Tue,  7 Jan 2025 09:39:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B30CCDB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 09:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 938FF60618
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 09:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfwiKniEwsQs for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 09:39:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CACC6606D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CACC6606D5
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CACC6606D5
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 09:39:25 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ffd6af012eso207679491fa.2
 for <buildroot@buildroot.org>; Tue, 07 Jan 2025 01:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736242763; x=1736847563;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dKs22mVl1Mbzlr+kKhBigoE8fzN59YAw2NRLFiiSSJk=;
 b=e+B+XtU8UCf3Q8vYIKW+WIgBAo9aeUqOEZhtvQYXDE8MzSP3c9xILr/FYq+qhn4tvc
 UwTXAtfbNbmI1NXMWi15GE2zW1bBXUNsEgnhSIx2U/9UbDm3BVE+cHMwceUtNLBbFjqx
 XNAT8ZUzEd7mpAtw2iOpNsosJhJpIqF7qXYJgEoTfMi5QCEN4fuYVTGE4PBdweS+95hR
 1LNETgkt0F4r8ta7fEawMfPX3Z6qA2QsMQAF54pS/T52cVM+BfJhJOLftLcrtaz7L1Rt
 vRydiWBo2GgE65JonWNwlve0vUNCppI+JliS/HUILz7wZ2ZUv+FU4CcGX0K//RSRqg39
 4/VQ==
X-Gm-Message-State: AOJu0YxDMYDEEhBcwH06dJFPwoTGTi57K/gRNn4H5zcmEsmQu6lwcoBv
 RRQx5FOQD1tlq3iM5pU6bRZqgzVKV3D6cOjaISLqYsE9u9mq4XHysYEp/QBL
X-Gm-Gg: ASbGnct4nj5E9lxx9AwpmhZ0ZofvwpKjVT2C7aYrsrmeyObEm0At+zvY2EqalpanNu3
 G3y9OU9vSX6iH7J6sP9pyRWUfocOZiCapZiglyUzjB+dArGEWeakkZLKcVCZuB9nlAamk27yAbf
 szKeZMAYjXtjnQVausDQ8Ya7LNRPROu3Re43C+zbFRgnD5jJ5562NpO6WMO+NvPJL8xtwurgNZr
 IDf7zmmeuo83GNHjr8wK2lEW1ic+A0ofWI=
X-Google-Smtp-Source: AGHT+IFDivZjvE4VQIfZSgXUXmvFRLiNc+HlQ0GHBFE1H6qxE+izLpfjPR6oR3NFzd6TJZbkTthh1Q==
X-Received: by 2002:a05:651c:1503:b0:302:2620:ec89 with SMTP id
 38308e7fff4ca-304685904cdmr183417351fa.19.1736242762745; 
 Tue, 07 Jan 2025 01:39:22 -0800 (PST)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b069e8csm58786521fa.74.2025.01.07.01.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 01:39:21 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Tue,  7 Jan 2025 10:39:16 +0100
Message-ID: <20250107093917.3217670-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736242763; x=1736847563; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dKs22mVl1Mbzlr+kKhBigoE8fzN59YAw2NRLFiiSSJk=;
 b=SFaswUTrzVVvCtZaBGopz6dm9jymcYB9QwaVGKWWdwSQMPUGjbC+a0h9FVbyLvxCZ9
 ka2g9gld7LJIA9nrv+LSV+dU23e8wB6KoUUtfxpM3HNm3F1LTaxcaP2lKs64oadSFdzR
 gCEGgTArXgIYkCMnIuZ/DhfsZ+XyUvDlUTNP4sfyf8xmlhYL2/mvr8uiva50YQ0/3OqL
 exBqdN1RO7apnnhmK2eMT2bHk3d/T39wNtDq8w0bueCxlLM5uHUabq2tbvBut1CZ2ayj
 YgipROtAwTmpsG/b7kn8WITnt7osbskxzLYBNsLzJ/C8hBquj28at/ffynuXpl2ATbKv
 qmEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SFaswUTr
Subject: [Buildroot] [PATCH 0/1] New package: lowdown - a markdown translator
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

Hi everyone!

Here's a neat little markdown translator we've been using in our project
to provide online CLI help texts from our GitHub markdown documentation
in products we ship.

It supports many features and extensions, e.g., footnotes, tables, and
fenced code blocks.  For more info, see https://kristaps.bsd.lv/lowdown/

For terminal viewing you need UTF8, and the 'less' program in BusyBox
seems a bit broken right now, but 'more' or the big less package can be
used to render very readable text:

    lowdown -tterm foo.md | more

I was a bit unsure of which section it would fit best in, so please let
me know if that needs changing.

The program has no external dependencies, yet resisted all my attempts
at trying to build a static version of it, hence !BR2_STATIC_LIBS.  It
is not autotools based, despite the configure script (it's ocoonfigure).

Best regards
 /Joachim

Joachim Wiberg (1):
  package/lowdown: new package

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/lowdown/Config.in    | 14 ++++++++++++++
 package/lowdown/lowdown.hash |  5 +++++
 package/lowdown/lowdown.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 45 insertions(+)
 create mode 100644 package/lowdown/Config.in
 create mode 100644 package/lowdown/lowdown.hash
 create mode 100644 package/lowdown/lowdown.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

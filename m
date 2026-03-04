Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FF5EB7EB2
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 09:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FC43407A4;
	Wed,  4 Mar 2026 09:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3P2ynxvc1Vp; Wed,  4 Mar 2026 09:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A14AD408F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772616007;
	bh=MZC02WqAqcRnBUAesGqC24UUZn3Ld0bPg9cQwoaVOAg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VGhK4+l8YCbdDTeeISoJlwvjMXqHvqTOAQQPEaFMTF4ozVrtI/NPRqjdY6QzpfmYa
	 XUewYgwlfywJbT849F7POyjJ9gaUWORLAqhzLif7W4pg9tRNVNQVnM8VdwU8tKocj0
	 MVE+a3Ap2AUAtcXi7k/b+legESI+/SS2dlRlbg13gDvDKWT3tZhGNrxVpHO8J+UxMT
	 xA5LKXk7dyzMIIs3q1XmMLN5P+NMvwSKm6LD12X8TWgYiSVHO5W0gg49FkDjgOkwqj
	 s3hvHziLxaur0P6nmAClxgBtwGUjioSfXBUf+h1Iroj3j9ysahSSEIG0p2yLgDY3uZ
	 gQNIVNfFMwS0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A14AD408F2;
	Wed,  4 Mar 2026 09:20:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EEAB231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D2DC607AB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ft-h2Jq6oxCv for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 09:20:04 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BCDEA607A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCDEA607A9
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCDEA607A9
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 09:20:03 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 8C678BDE1A09;
 Wed, 04 Mar 2026 10:19:59 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Wed,  4 Mar 2026 10:19:09 +0100
Message-ID: <20260304091915.1102943-1-br025@umbiko.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1772616000; bh=vsFskkwrmaDrkB01xHlZfVxtrQq6cm1hkEbL5nZiZqQ=;
 h=From:To:Cc:Subject:Date;
 b=FsosQ5ptC4q6lfVY62n00lm7/vl44+0eJBI/UYnXy+Bhhh1lpYLujTh6UxnQkJohz
 yh+p3QYvvYv1TgfYmhpvqFkOML8yj/t5KEN+0Iz+keOU3cuH+wNUAJSuCi5UHDKq7J
 hhpUEUrb7yoDsM5GpbPxUPfLGcWFCthOd7ouaUjw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=FsosQ5pt
Subject: [Buildroot] [PATCH 0/3] package/icu: fix size requirements
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

TL;DR

Simply adding Unicode capability to a Buildroot project grows the root file
system by a stunning 37.6 MiB (more than doubling the root fs size!). 

The ICU source ships with a prebuilt data set, containing comprehensive
resources for multiple languages, locales and features. This dataset can be
tailored to include only those resources necessary on the target system. 

Prior to ICU version 58, this was done using an online tool; this website is
no longer available (https://unicode-org.atlassian.net/browse/ICU-12977)
(2018-06-28)

Data customization now is built into the code, needs additional sources
(downloadable) and a configuration file (user supplied).

Applications in need of Unicode character representation usually link against
i18n and uc libraries. These libraries depend on themselves and on the data
library:

$ host/bin/aarch64-buildroot-linux-musl-readelf --dynamic \
	target/usr/lib/libicudata.so.78.2 | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]

$ host/bin/aarch64-buildroot-linux-musl-readelf --dynamic \
	target/usr/lib/libicuuc.so.78.2 | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libicudata.so.78]
 0x0000000000000001 (NEEDED)             Shared library: [libatomic.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]

$ host/bin/aarch64-buildroot-linux-musl-readelf --dynamic \
	target/usr/lib/libicui18n.so.78.2 | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libicuuc.so.78]
 0x0000000000000001 (NEEDED)             Shared library: [libicudata.so.78]
 0x0000000000000001 (NEEDED)             Shared library: [libatomic.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]

The command line tools are necessary for building the data library, but not
used on the target. The extra libraries are normally not needed on the target
system. 

After optimization, adding Unicode now grows the file system by 8.2 MiB.
Not nice, but tolerable :-)

Andreas Ziegler (3):
  DEVELOPERS: add Andreas Ziegler to icu
  package/icu: rebase patches and add upstream tag
  package/icu: Upgrade customizing for size

 Config.in.legacy                              | 16 ++++++
 DEVELOPERS                                    |  1 +
 ...0001-dont-build-static-dynamic-twice.patch | 14 +++--
 .../icu/0002-link-icudata-as-data-only.patch  | 27 +++++-----
 package/icu/Config.in                         | 47 +++++++++++++---
 package/icu/icu.mk                            | 54 +++++++++++++------
 6 files changed, 119 insertions(+), 40 deletions(-)

-- 
2.51.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

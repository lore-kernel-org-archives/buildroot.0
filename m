Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E701FCC9CA
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 06:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36C7A41DA6;
	Tue, 10 Mar 2026 06:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T112ZZam0xmS; Tue, 10 Mar 2026 06:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E67418EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773122561;
	bh=2waSlTlwKlKn/t56nLeI/zuVsPTfXsmiPahmjU2RNoQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OOHGPl9no3EFOx+QLsBtjrdzcNOp1PRb4FjKS5TMnSdHDcyE13T/RnG3HkSnFoEh6
	 0NWx9VA5ZFYHcY/5yUWFG9eITBoFncXHZyFahIWAWOf4JJ57qBxIjr/Xwjyg10ZUfx
	 K431cvp1nMfkm+08MrmyEdjy8cQV5JcSVUrnn12HkI/75e6rdvHp0X/QUqyr3UGe60
	 0F6LItnin2OZjQW6dsuZZgRTXH3afQ/c+NXAETOrokjgfNRbt/Np6jZ4upHYNbUCCI
	 9RlldulY3Qc0ApKz2Kz+rzWOzBnf70bDfr1Q0jXFDQJo0K05Np18GwfO3HJLRck6BM
	 HzSMv3BrqLqgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18E67418EF;
	Tue, 10 Mar 2026 06:02:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BA3435C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D1C660ACF
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BVQ4Av8iFzV for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 06:02:37 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA00E60844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA00E60844
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA00E60844
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:02:34 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 77B7FBDE2721;
 Tue, 10 Mar 2026 07:02:30 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Tue, 10 Mar 2026 07:01:46 +0100
Message-ID: <20260310060155.240036-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304091915.1102943-1-br025@umbiko.net>
References: <20260304091915.1102943-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773122551; bh=aEZO3CyPBi9uS9K5Pk4lZpi4OAwaBRj/tXT7EbOmNwI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TgROsMkzX739NVJ7FgZdFGC/bIdC96V/Uk1GZlY8crlllzc1JkAck80pMBbYpPRVC
 EkTNW+7s/uREc5f+tXsxeoAyhsvb2vTD2xEz4bXyDbYAjqmmKzEjwoJAaFbzlOVXqp
 4TFgd2diRNIephB1xPDajbh+Ym2Q06EAfvSz6GRc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=TgROsMkz
Subject: [Buildroot] [PATCH v2 0/3] package/icu: fix size requirements
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

[ Changes v1 -> v2: rebased (Config.in.legacy changed) ]

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
  DEVELOPERS: add Andreas Ziegler for icu
  package/icu: rebase patches and add upstream tags
  package/icu: Fix /enhance customizing for size

 Config.in.legacy                              | 14 +++++
 DEVELOPERS                                    |  1 +
 ...0001-dont-build-static-dynamic-twice.patch | 14 +++--
 .../icu/0002-link-icudata-as-data-only.patch  | 27 +++++-----
 package/icu/Config.in                         | 47 +++++++++++++---
 package/icu/icu.mk                            | 54 +++++++++++++------
 6 files changed, 117 insertions(+), 40 deletions(-)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

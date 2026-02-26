Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A032FD9E10
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B603460703;
	Thu, 26 Feb 2026 20:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikfmn06yRWNq; Thu, 26 Feb 2026 20:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 659E460718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138487;
	bh=xcDObcAWNlwNhhc9SSYanP7F51qSFgT+ZN8rPnpeuU8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fdyepmgnbxsFU7AYrMNXe8U+YYhJttJZAQJD0S4rYQXNvuRjVZpHEjI5uEqiPR6BG
	 Pi6Flbf4fb9yKgGWWKpqVGvDm2cd2JCEej4RAJP+Xuo4QRlucf8hcf2cqRIiUXcqUI
	 UkHYP58jl0G1FyLgbnCYX/pWB2SpVo5H2/UY6LXKGhIVPcGrTLEpK9CW0wJqDmOGaQ
	 2F5TOQpR0TvsKMZDzT8d/xoiPKSnc8ihmo6Cw9C1nFhwmDxEndnk8Aq6J/rQUVHkm2
	 DYIUYlziRFiNLSMM6JSnLgUK/jUzeVkShO9VvR79WnXlwdEG6hVUlzASL1SqXaruD5
	 BGTNkjxD2th1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 659E460718;
	Thu, 26 Feb 2026 20:41:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFA7A272
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00CA581184
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmKMLo8Pqcup for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA5D981188
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5D981188
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA5D981188
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:41:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 653B4A4C2CC2
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:41:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42998)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vviAj-000000000MU-1Z5h
 for buildroot@buildroot.org; Thu, 26 Feb 2026 20:41:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:41:21 +0100
Message-ID: <20260226204121.3547356-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772138481;
 bh=sVjQlMMFjSdFuGx1MdnWHU+74ctev2/qBphD1OBmyTA=;
 h=From:To:Subject:Date:From;
 b=uaLkWknjWfJ4WVf+4nep81Shpj+PrqprwNJN/eAakyqnZ51WiWNwhVTc+IPptTrD2
 tsQkAsHjEe80gMIvt+V3y72bu8s1EW2M6BYtn86MyBWhA0jqzO2Uu05a6YpW3EeZ0x
 ery6Iana7HdvePwk8X8gOUhEE+bAap05fLf2zhLBGbhgStbGSDXGf2mG1ki7+F41AJ
 Hv1LyVm4e5yQIcJFSYd+st4AG3ZjBnoRjLLV6kBfz4vfY2kg5/TnJPIO6LahJhIzs7
 cc3eq2toyW7CK+tJR+H5tWGd/MWe6skpQhNCI/QQ1XOheVO5fqSDhaaDsiqIDhS3YT
 fpGHvDexr01Vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=uaLkWknj
Subject: [Buildroot] [PATCH/next 1/1] package/gkrellm: bump version to 2.5.1
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

https://git.srcbox.net/gkrellm/gkrellm/releases/tag/gkrellm-2.5.1

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gkrellm/gkrellm.hash | 4 ++--
 package/gkrellm/gkrellm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gkrellm/gkrellm.hash b/package/gkrellm/gkrellm.hash
index 2f0fbcbeb4..e8a6ef5540 100644
--- a/package/gkrellm/gkrellm.hash
+++ b/package/gkrellm/gkrellm.hash
@@ -1,5 +1,5 @@
-# From https://git.srcbox.net/gkrellm/gkrellm/releases/download/gkrellm-2.5.0/gkrellm-2.5.0.tar.bz2.sha256sum
-sha256  68c75a03a06b935afa93d3331ca1c2d862c1d50c3e9df19d9a8d48970d766b55  gkrellm-2.5.0.tar.bz2
+# From https://git.srcbox.net/gkrellm/gkrellm/releases/download/gkrellm-2.5.1/gkrellm-2.5.1.tar.bz2.sha256sum
+sha256  089e3c1ed398482e682c9900b504ea166a6144a6c9fa041e70c5bbca6b177e63  gkrellm-2.5.1.tar.bz2
 # Locally computed
 sha256  691de85c3c6eeda5b6982c751548575344739ce4b4418d78905e599359f6c435  COPYING
 sha256  a4bb0b604fe7d40ca4469ffd5e2e2de70ff8ece43e47980ab2c8962d5e913330  COPYRIGHT
diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 6ee00858d3..16d0729d5f 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GKRELLM_VERSION = 2.5.0
-GKRELLM_SITE = http://gkrellm.srcbox.net/releases
+GKRELLM_VERSION = 2.5.1
+GKRELLM_SITE = https://gkrellm.srcbox.net/releases
 GKRELLM_SOURCE = gkrellm-$(GKRELLM_VERSION).tar.bz2
 GKRELLM_LICENSE = GPL-3.0+
 GKRELLM_LICENSE_FILES = COPYING COPYRIGHT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

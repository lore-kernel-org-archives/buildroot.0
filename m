Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5067910AB822
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 21:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1903940E70;
	Thu, 26 Mar 2026 21:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSp71fSeQNqV; Thu, 26 Mar 2026 21:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B45740B5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774559730;
	bh=WhcP1qltHfAtV/ipS1DBTly/bka3awt1NAibWp6Zc9o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P9Ua1hM+TzZC4zuo3c/5ekw71/ryVFLUyY/MWVOaIk8CTIUjyiBTkXVPKZWpMQmds
	 HXwnV4LckzIm73jPnJJGUY8lWKhTK1d09Z7zF8pSilExvkrrkmMpZQaoD0Lb3Z8slg
	 oGGyi0sA+htH3SIfCz/qESUXN2tKrm9wF6HLPfXAfXJ6CLyNBvycWKytkvYxb/dBd2
	 1Znysf+yeK+HX1uzndBKW05rB8bOdKiu2umt5Z8Z7937byc/AyCRdPvjuVi8RrkxW6
	 XqaTf8Eg3fn9xiL5KTfp3hn0Pft4oRHIYxhZZRNWj/9KVtzXOfm1MqPrB92gNG4git
	 VLyIMzHv+l01Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B45740B5F;
	Thu, 26 Mar 2026 21:15:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3061C2D5
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16B1A40754
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VqH2yM6F4EsO for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 21:15:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF1F740713
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF1F740713
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF1F740713
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:15:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c201.dip0.t-ipconnect.de [79.214.194.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3663EA4C0DCF
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 22:15:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49662)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w5s32-0000000070b-3bxa
 for buildroot@buildroot.org; Thu, 26 Mar 2026 21:15:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 22:15:22 +0100
Message-ID: <20260326211524.3598703-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774559725;
 bh=RVsCj9+2nKXYdSumRQMiGPZb7INE49gy8YlOYrWA8PI=;
 h=From:To:Subject:Date:From;
 b=WHprmZ072c+eGNEDP2u67KgdIDSJ/z1zQuTwUL/IIZRfwwXlioXmU53dc9/g+1A2y
 64ocrUW9WbthzHyIL7L9fZLutDeR1Nl9kB8WkDnCqC17KPyg+jh6ukutmpuSjQlAxk
 HBW0y9N89W63pWU9qGijZvazrfmVFE1QgideLSzduNAvKd9wXfmBICZ0VU8GmpwsKX
 0LpEC86sHt0qUf+aMT776xDbN5YqHiqg/MfeVFKabTnq8T36QMlkXAfdOlpVjr1O2E
 QY4icrSFqDXHZTZu0CS98eF9Si5jD7+H8/jDLOmu7JevSYOKQ/KMCsMJIlrmkHe61R
 TQ/e4ptUTqF7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=WHprmZ07
Subject: [Buildroot] [PATCH 1/3] package/intel-mediadriver: bump version to
 26.1.5
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.1.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 350a3c8761..d0f0d36eb6 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dd9132c69d68702b87520d9f4a4ee51796d67cb164e8befbcd024257369edba7  intel-media-26.1.4.tar.gz
+sha256  c56899fecc003d047ce6afbdf471851512e0ceac66c2ef22ac36f1e6ce46170c  intel-media-26.1.5.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index a3f64d0542..52a9d1d99c 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.1.4
+INTEL_MEDIADRIVER_VERSION = 26.1.5
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE7AC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 19:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A16A40CB5;
	Fri,  3 Jul 2026 19:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEFoDRgyKyj3; Fri,  3 Jul 2026 19:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 390D140CB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783106395;
	bh=lsFc6Mm7fIx8RWw6gNudviRej1vLZtplkpUkZYz0sgM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LHSfUwfjn/ce8zl1lLdmkyBdSS3BvgfMdNOVp5gSuxJHHMmixmC3wUvgIGAMMhTpN
	 EwpBbfkqXTs41nW24iSTi7RRSy4FeQoXVotkaow7AD+sxaqjy/W6DBwRCRbdXyFv7U
	 cYRq08XcM0+rUCp1sSH8Zr64yE+JUIGcLhrRgU5Hl+9Uv//ynTxnoZcSsIHMT4Bz1X
	 xaQHKspK3mcqCYXK2zM8S5Q4A2jwGmfYaRhOmJJ4SIILfiKYqrPvirTTQ4nhOAG/Yr
	 /zkbv8uowKS0an+GAhkR7uif+nTwZ9HJpxJ2JZko8JKVEwF/9b/5SrkCk1KnX6UXcr
	 HdniTzEJp/uXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 390D140CB6;
	Fri,  3 Jul 2026 19:19:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D423314F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA5146070B
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNyS_36vb_y7 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 19:19:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5AC9606CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5AC9606CC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5AC9606CC
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:19:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6FC1A4C0465;
 Fri,  3 Jul 2026 21:19:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40048)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfjQV-000000000O4-246U;
 Fri, 03 Jul 2026 19:19:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Fri,  3 Jul 2026 21:19:51 +0200
Message-ID: <20260703191951.3692295-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783106391;
 bh=Y4sqx9rU3+RjlTEK9qgsbOTWLmsqolF3Mo+1YKhF8jc=;
 h=From:To:Cc:Subject:Date:From;
 b=TlVP62TPD4yrlV2nmfPpFFJAMFE695+oaDoyN4jJmT6wobJ7y9/AeVbfWG9d3Phiy
 P644MTsh2ITfPQ5CntbZDZwDLPlazipA4BqkCkEPyO/mA93nOylYJPjF55xJv1nI0S
 YiFHY8dbb2Lz3d2F1eoqnxuViu4pg4yLd1UmdXJb6x7hD7umCoFBmaSQMKp281C+b9
 ma49c7h/cLy0FZEeVC3de2tOuQqFPCiV7RUpnrPEadhYDEoueHRzBMbeiEB5aw1vpj
 dsMUS4bAUcSz9tA8qLBzI8YdT1FSuGkHQXvNcYpt8yzYUhwAqevzt94ZxbA/msEaaf
 lBKU2C0n/0/cA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TlVP62TP
Subject: [Buildroot] [PATCH 1/1] package/libevent: security bump version to
 2.1.13
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

https://github.com/libevent/libevent/releases/tag/release-2.1.13-stable

https://seclists.org/oss-sec/2026/q3/7
"[None of the GHSA's list CVE id's at this time.  -alan-]"

Switched to sha256 tarball hash provided by Github, drop sha1 hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/67527841a8d7750f081e1de009edd75cfe5a1cf8

 package/libevent/libevent.hash | 4 ++--
 package/libevent/libevent.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
index 77574e784b..e047031f48 100644
--- a/package/libevent/libevent.hash
+++ b/package/libevent/libevent.hash
@@ -1,4 +1,4 @@
+# From https://github.com/libevent/libevent/releases/tag/release-2.1.13-stable
+sha256  f7e9383b8c0baa81b687e5b5eecc01beefaf1b19b64151d95ed61647fe7a315c  libevent-2.1.13-stable.tar.gz
 # locally computed
-sha1  cd55656a9b5bed630b08f05495230affb7996b21  libevent-2.1.12-stable.tar.gz
-sha256  92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb  libevent-2.1.12-stable.tar.gz
 sha256  ff02effc9b331edcdac387d198691bfa3e575e7d244ad10cb826aa51ef085670  LICENSE
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 355dfedcc1..cc8fb21915 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVENT_VERSION = 2.1.12
+LIBEVENT_VERSION = 2.1.13
 LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)-stable
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4A5109448A
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 18:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50DD48473A;
	Sat, 21 Mar 2026 18:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bCno8qkFaqf; Sat, 21 Mar 2026 18:01:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C8C6846AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774116061;
	bh=PhM6TAcsjXqPY1XSLoh51ixR/POdCODoAUA2IJ3CN8g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ay6BitZVONGFeudKg/Or7D8wEUxyHNQ0ZZyrCQCr6XYnwP5B9O/Y0n9sJAw2TmRTh
	 v03jmYLUl784zNjiOY7z3uWgbfL4ED58mjaEK0riQCBAGljhPJCaNUGHNQy6i4z5t6
	 tMoOKxVr9ZfjEq4+/SbTMRGMusHO/6MDFHUBCsjnjn6lJ53HMA618Yc/HQEt4EdbW+
	 bqDXb6hg9U4Qke04mQCQakfWmvFyO1nArp0gBbfim+4JgjU+13kiOo1Ihr/ees04kv
	 j7oLxIGsuPIfmDAQf3jwgY0sUUO9JNRpjTiqeMV9gkRUXntBP7BDMe3wzi9tSKOvq2
	 p56pBeWTwBjMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C8C6846AD;
	Sat, 21 Mar 2026 18:01:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DEEDC265
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF69C611A2
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbPR8sWCEjFS for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 18:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71C1D6115B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71C1D6115B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71C1D6115B
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:00:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce09.dip0.t-ipconnect.de [79.214.206.9])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51334A4C0DF5
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 19:00:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37348)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w40d2-0000000071T-3hMr
 for buildroot@buildroot.org; Sat, 21 Mar 2026 18:00:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Mar 2026 19:00:53 +0100
Message-ID: <20260321180053.448107-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774116054;
 bh=rUad2SkIxdJszhVghowYENyZWSQxb+Qe2JEzjzNRFGo=;
 h=From:To:Subject:Date:From;
 b=XrKCwgcOCVDuWQ86K63EK2VzvJSir7p09bdmDAFXFC/EtdGLC/WFhKye2VF8krfxS
 /CxwcpLhMcJ7vKMr2zn7MKHf47MtFSRZiz3AIMvgisPgND++U2LxGPxhZyKQ31HR1h
 E6qjUejMCJM1ukeX5bgc4iXNitFxIVIBDzjYD92BqV9yxmEmo/Bj97hlQzI/g4n9GU
 lZboNlVEc4CZSiG8XmwvhZIFFjDgei2xmmO9FYHoVfZ04GK9oT89VtEOZEloU0NLpj
 2s4j3g4MfBByXQrISU/Wnd+4BSuvoxucOrxZokmpBr6c0QyroVj6fAgqV04EcrkHDV
 V6nIVkdKTD2RA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=XrKCwgcO
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: bump version to
 21.0.6-Omega
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

https://github.com/rbuehlma/pvr.zattoo/releases/tag/21.0.6-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index e4930b9fb5..ecec000e3d 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b9bf700f0ee93f0d6b87952e9420e277c384cf0d3b07dc2849f5496304104af9  kodi-pvr-zattoo-21.0.5-Omega.tar.gz
+sha256  f6df1fa29ec3778f591281f57190099bf5a510c293c711ea978497556765352f  kodi-pvr-zattoo-21.0.6-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 8171939c60..2de33b26b5 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.5-Omega
+KODI_PVR_ZATTOO_VERSION = 21.0.6-Omega
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

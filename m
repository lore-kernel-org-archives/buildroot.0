Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430D9E95A95
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 14:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B69C2811D0;
	Tue, 30 Dec 2025 14:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ND1TPfsweaoh; Tue, 30 Dec 2025 14:09:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B36968115E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767103798;
	bh=qhMFUVxqNbmIiDRKIEASAkVE+EumdxOJ295tSb8Dcz8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J9r0MeM7F6uIZQyRuwlKO8g/izGHDhi4yR+4T7lvTU9J0UA1omITUt+HXdDOVbStA
	 Jo4MCzwhjpJKx3Rp0UQUgj7i9vT/QlV1bZ+rnBGpt9P+OtIweheaMFgm2327cphtSR
	 erwj1Kpw//AC82bmPRdEOK7aRc4ekYZ1TDLjmNdedZQ6pF0wvdvZ4ECjCYm/Yp+Xc8
	 ztM+sm2EvK4RCg4TQLj7jO3S3iCDU7b92JemhL8mzUNGXzB3GZwH6VOS7rsQESgAjM
	 M9+36LdTXROBz/1eYOMhuN6PKibmsp8p8kbgneRZGcDV3e0s0QWeOQCKCTjyFyVN5I
	 pN5zDkWWWAYFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B36968115E;
	Tue, 30 Dec 2025 14:09:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA7D335B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BF8560604
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ji495etVt0Fx for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 14:09:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2B58607FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2B58607FA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2B58607FA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 14:09:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9594A4C25A9
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 15:09:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52040)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaaQ3-000000006Ld-0hSu
 for buildroot@buildroot.org; Tue, 30 Dec 2025 14:09:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 15:09:51 +0100
Message-ID: <20251230140951.1558531-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767103791;
 bh=NFgRgqcAhqTvG49tnLjQGRTCqXZBwMYl0CncEi6j1kA=;
 h=From:To:Subject:Date:From;
 b=Zm8chmntHFYDwHKHH3DirRvqQZ3K7BU3uvotC+vIrIK4fjawWwqO6XnOTxngRaNk+
 +cf1Y4tvU7trEUw/AWsKfBx32uKEito1FBzoxyuXQXEcD8pgMs4NLNEDA3jzd7TNLU
 9PdY1HbFv//MohA/54PsPq25WjVlAisnBNBzgecrnBnDfmWngJ7pvYn6brJbhivBBY
 CHaza820SyI9g5KgDYq2LJ5bQktuNR2py6HRle03mOsZmv/zq9+CIC6zewj4UZ7vtV
 sEz69gO8LqdqP9VS/gOX3xg+ICA2CK0mwGaT5TU1wgh61akGCHE08LW2oR5QITkXCs
 s35V0nWmojrKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Zm8chmnt
Subject: [Buildroot] [PATCH v2 1/1] package/utfcpp: bump version to 4.0.9
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

Release notes: https://github.com/nemtrif/utfcpp/releases/tag/v4.0.9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: upstream renamed tag 4.09 to 4.0.9 (Thomas):
    https://github.com/nemtrif/utfcpp/issues/135

 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index d995899165..4b43eb330b 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f808b26d8c3a59def27fea207182ece77a8930bd121a69f80d328ecf3cfef925  utfcpp-4.0.8.tar.gz
+sha256  397a9a2a6ed5238f854f490b0177b840abc6b62571ec3e07baa0bb94d3f14d5a  utfcpp-4.0.9.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index 4e17364e0b..72a590eeb3 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.0.8
+UTFCPP_VERSION = 4.0.9
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

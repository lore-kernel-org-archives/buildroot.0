Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA9CCD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 19:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E872F811C8;
	Wed,  6 May 2026 19:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWIRBPAQQz98; Wed,  6 May 2026 19:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE3B0812A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778094167;
	bh=ni3dWZn8VIxSxjW3ZySc/i7Jw2IzdXoNRE81iGcfgbg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nmUCPa+tdBCZTapN+CiKQau1atCm9IQ865Vk3fw4XHHZdiHn8KxUNDio2O4cP/emJ
	 E7yfwf2LoGcAyyE9vh3Xdpm7YHZm0AKJ6ESmo/dS+DT5wN8t1vo0Cd1y5uGwQBlwmy
	 Bhg0L153QuS3q3QAhtTKrTSjSW0FcctXJF7NDGm0ChQZV4gacwEzudIYrRmUXjyxKb
	 zmtDDK5idHHCyBP28KvpyRr4E6Qtgxm+lMARBJSJnUuOqk9CWmdFn/lbwhj05hF++F
	 DJfl0vzIbPOf834RYIzMYLtQKSarr/Cqrz/7+3JSUmqmVoku18XTgLgoj4FXH2XLkJ
	 +4aTwjUIqJAGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE3B0812A3;
	Wed,  6 May 2026 19:02:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C2C9280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 19:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E58F5812A3
 for <buildroot@buildroot.org>; Wed,  6 May 2026 19:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqN5WMGqVELH for <buildroot@buildroot.org>;
 Wed,  6 May 2026 19:02:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F390E811C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F390E811C8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F390E811C8
 for <buildroot@buildroot.org>; Wed,  6 May 2026 19:02:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1777031775; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 May 2026 19:02:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wKhW4-00000002kax-1odE;
 Wed, 06 May 2026 21:02:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 21:02:37 +0200
Message-ID: <20260506190239.655752-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=l0IxGO5ht14lkZJ+l+iSNgFlvs0aR0TDMeEh3agOEAEm+ChgbZLzZcO0pCibAVlmEgK24Nkx9oeo9Rbc/G/6YwIJ/4yVVrJGWAXFbAr9faTjUBmHL7rJa2CYf3a0i9mWS78swMZbKD7MbCGBpWkDTfofgdyw+CmHSbRfWcsuv0jHrE6mbLqmsGgTBxlx1y+rcTzDqcaacLKzXd0WHgm+mxjKtdGTrILdSbObVrJ2/PlKqWrfcBrXY7pjD8MwQpKcqZlmyzJ3nFhb22bu40op5DQQVOjyBNfd94+quoKYZ4sg2MhtjrQP55aT9OsUQIMuyZmEpsm9p/loTUYOmWkuhQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=c1SryQ9S6Wg4rOIJCKfEu5itHZghRrHBzMmzvnbPLcw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=l0IxGO5h
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/xlib_libXpm: security bump to version
 3.5.19
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

Fixes the following vulnerability:

CVE-2026-4367: libXpm Out-of-bounds read in xpmNextWord()

libXpm uses a number of internal helper functions to parse the XPM file
format.
One of these internal functions, xpmNextString(), checks for the NULL
terminator when looking for the end of the current string but not when
looking for the beginning of the next string.
A small XPM file with a malformed color table definition may cause the
function xpmNextWord(), called from xpmParseColors() following a call to
xpmNextString(), to start past the actual end of the file, causing an
out-of-bound read.

Advisory:
https://lists.x.org/archives/xorg-announce/2026-April/003690.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.hash | 6 +++---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index 3582169891..72a330f1ad 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-October/003425.html
-sha256  64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43  libXpm-3.5.17.tar.xz
-sha512  52f9d2664a47a26c1a6ad65d18867de870b66947b0b0d99cca3512756a0aaa6ce2a245c0b49f20b70c3ce48bf04c47c333e8119a147465c277bca727f6ab017e  libXpm-3.5.17.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003691.html
+sha256  ad3576d689221a39dc728f0e0dc02ca7bb6a0d724c9a77fd1bfa1e9af83be900  libXpm-3.5.19.tar.xz
+sha512  dd95a70af0ac2fb0f5876e69ad19b38128c5add94b00238ee41a22634aa4dc56b22c1b47c4baa6a1ab549308d11b302c250b405322da8a64ea24441a065fbada  libXpm-3.5.19.tar.xz
 # Locally calculated
 sha256  a80d706759624a04aa90fd62bc644a360fc3d72e08dcbfb129f167c11ca285de  COPYING
 sha256  cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71  COPYRIGHT
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 1239ba0d4d..a2a652df17 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXPM_VERSION = 3.5.17
+XLIB_LIBXPM_VERSION = 3.5.19
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.xz
 XLIB_LIBXPM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

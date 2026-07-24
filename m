Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0897DC531C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 17:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8D3060B99;
	Fri, 24 Jul 2026 17:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0vcuzuv8I95; Fri, 24 Jul 2026 17:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BDE2607AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784913845;
	bh=1nMZzb+w8nMqNsgkwkGT5Ru+YYA6j6HBqHE/zwwG1PQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PdLYGtWyCkdWrqecSGh7IgzO96DQWUTIZ3Gz8bxIz0ZtXoFnd9HJ/hZcyvyEDwhd7
	 kZDSOrxY87KBlaSowE7pR7TaTAb6Xr20uaU1OTNRHFCQmL+1gjLFpBUZ0px34vmx1M
	 hW0aijfiPl4YxRUZExt6KE50FTib1YmyS/JgX6iUfI0ksuMnU8DHaRNJDn5z/TlBGD
	 rsXAhHVmuXT4dfdLYFuj+5V+mjlrb0tbH2WAEPzlihvlmGHrRrSjfjnW0bFnPMYQ4E
	 HYdDwJDOAQs0oiLer+D0jYwSqbdPoruhHbkJXI3UhYhjs6fBwdzPDJTAM1e248Ga4L
	 v10fEVyMN2KDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BDE2607AD;
	Fri, 24 Jul 2026 17:24:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1640224
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7F5B407EC
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrLtM_mhlquo for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 17:24:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DEEA40791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DEEA40791
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DEEA40791
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:24:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a00d2.dip0.t-ipconnect.de [91.58.0.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ADAA6A4C40EF
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 19:24:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45100)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wnJcu-000000000gU-2yxt
 for buildroot@buildroot.org; Fri, 24 Jul 2026 17:24:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 19:24:00 +0200
Message-ID: <20260724172400.319609-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784913840;
 bh=Hwi6vDcR/Xpwn5YB5Rcdvt80R4ebducdsUrXVPY2ZKM=;
 h=From:To:Subject:Date:From;
 b=e6BAbYIoTy4cxx10Fy640ZO+sJARIEMKb68vbCIV6TlJXIM8HVBytnAz1AVAvkJBe
 AsGPfQayfLF/+FpDRHqIcb1sOY7SYaS9x2aN59YrVYf6eLr54dHDzKOPnRsHSfngLf
 rheb3YpiFCDHmjH6gKNePAtW7+XkSbBzGbstOgjmw5b6r6vQsP/vNZlRzhe4kSV0CM
 K7b1P6G0WoCGOX0KhAirkydpdSN5KDFkQO3yOXHiCiJk/PhSAfpjL0P+ED7qnaO7AO
 KBQtBFaK9Tp+pRzdKr/LWA8ZQmVDN7lFyqXovp+SoQORyLuvHGiRP7s62Kq3dxQKGj
 ObULsn48fWhsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=e6BAbYIo
Subject: [Buildroot] [PATCH 1/1] package/libass: security bump version to
 0.17.5
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

https://github.com/libass/libass/releases/tag/0.17.5

Fixes CVE-2026-61626 & CVE-2026-61627.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/9ccb7989abf5ef6cc74c643bcd8aedf81bdc1c50

 package/libass/libass.hash | 3 ++-
 package/libass/libass.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 2f4f718813..467c9b3816 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,4 @@
+# From https://github.com/libass/libass/releases/tag/0.17.5
+sha256  2dca25c0e0c837ddf00b52011b3f82cac1e4ddd3ad018227806b0c2288864acc  libass-0.17.5.tar.xz
 # Locally computed
-sha256  78f1179b838d025e9c26e8fef33f8092f65611444ffa1bfc0cfac6a33511a05a  libass-0.17.4.tar.xz
 sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index ff42c6d621..3675a75f93 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.17.4
+LIBASS_VERSION = 0.17.5
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

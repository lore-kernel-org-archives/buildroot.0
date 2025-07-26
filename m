Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A3DC87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 05:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686EB409CE;
	Sat, 26 Jul 2025 05:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqE-fwpme0PM; Sat, 26 Jul 2025 05:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98845409AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98845409AA;
	Sat, 26 Jul 2025 05:59:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48ECADA
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 05:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A74380DA1
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 05:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwGLe3AD2wKf for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 05:59:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90D33809F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90D33809F8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90D33809F8
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 05:59:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C59A2A4C0777;
 Sat, 26 Jul 2025 07:59:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57580)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1ufXw4-000000000No-0o3C;
 Sat, 26 Jul 2025 05:59:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Jul 2025 07:59:06 +0200
Message-Id: <20250726055908.3395125-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753509548;
 bh=Q4OptSKbsrHxyydPc+JzIGCoSTCj2SD4aO23wp7ndxw=;
 h=From:To:Cc:Subject:Date:From;
 b=qZKdzHlbo5B+rgnSAW7z9KLjn2Xg67PpeQutqNXFxBX3ogaNGkKsqQIiYOgW/bCvL
 E4Yn0m80cw5GJESscAzKzwr0CMxGLUvUXDak1tB26L84B+xqoRKwRiyM5Rx4Alsnco
 a1rsdaJZePsZYRBbKBzh8SBvKXk8K+12lZTKcDw2hjFCRN0+vlkWOv0iL9NroDajNO
 Y/jY1zNMq7sAhkFicWylYbq9SfmaJCYY0ZPI6uZByqi88gj+9sV4tPx/Dmwshp9njq
 khQLSc5IB5gJ4XA/u8Ad/VRwDiVXefTeIG0Ur2Rsxlnz+hdcxQr3WrB9I2roJjExA3
 3kfMzw+oGxgtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=qZKdzHlb
Subject: [Buildroot] [PATCH 1/3] package/libcurl: remove configure option
 --disable-ntlm-wb
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

Upstream removed this configure option in version 8.8.0:
https://github.com/curl/curl/commit/50def7c881ba560ab6e0235990e8f07fa69f4bc8
which was added to buildroot with commit
50bdb2a3b7ace71065dc0b8a81bebc173f84a8c4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcurl/libcurl.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e390c9d1bf..114ff3d70b 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -15,17 +15,11 @@ LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_INSTALL_STAGING = YES
 
-# We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
-# support because it uses fork(), which doesn't work on non-MMU platforms.
-# Moreover, this authentication method is probably almost never used (see
-# https://curl.se/docs/manpage.html#--ntlm), so disable NTLM support overall.
-#
 # Likewise, there is no compiler on the target, so libcurl-option (to
 # generate C code) isn't very useful
 LIBCURL_CONF_OPTS = \
 	--disable-manual \
 	--disable-ntlm \
-	--disable-ntlm-wb \
 	--with-random=/dev/urandom \
 	--disable-curldebug \
 	--disable-libcurl-option \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

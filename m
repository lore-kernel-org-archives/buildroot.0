Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F3D107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 06:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 714638146E;
	Sat, 14 Mar 2026 06:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0EicYMY3DLD; Sat, 14 Mar 2026 06:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABF5A8148E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773469146;
	bh=uuZe0lKHCSflQyy63P4JZccFixNc4Fymrl0LCHIa6Ow=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cp3nakGOzfIJ9SH/OKZvgnkXxwFAXSJxOmbDD42ipLLKcjeTic44eHvqj08Bp1dip
	 TpAiDmGqIOpCeUKszgQ4iXy6sdr37PuXQY+6rg5gme1At/txe5coPb7eL1aGlbIbQ7
	 YHjSVCktSJLdDzSZF6+wTeGkhKYWbIeFxpCybhlfrOQNz6fmeJBR03zj4dT1HHIAhN
	 Wmny5eH+HHfFZmNox7oOnXiltm/OmK75qKQGh44xVW8xtAnaLcDW99D+8B4HObkztw
	 0+SwVNMSiAimc1aqeIkrtAszBHlIHIF7CV9gY3HR2su3URLX+RT+k61+HP6DNvhs1U
	 qe6yX2b+R7Ohw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABF5A8148E;
	Sat, 14 Mar 2026 06:19:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE27A3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A32D640072
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pOPxtSk_l04 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 06:19:03 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7050240055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7050240055
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7050240055
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 06:19:01 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 21A6FBDE0BB6;
 Sat, 14 Mar 2026 07:18:58 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Sat, 14 Mar 2026 07:18:33 +0100
Message-ID: <20260314061837.9425-2-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314061837.9425-1-br025@umbiko.net>
References: <20260314061837.9425-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773469138; bh=QqK4HcG9glL7PbnFmAEWbWp4i4WWYa2Z2aJUWf+01BY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CWoKFMqmt9r8BnnGDcVpVlFnlgEMqnHKKAFjk5L/erEyQ4i58onjpcBRus8qfJ+wZ
 /Njq8GlfjzlEzaJM/27x+7I5eouiC3YekGL8yGqr8RxFlFUT7QrFixBB6GXXSxj253
 I++JDVDApgVBmhz8BLzGzZzBgrAp5cA5T4t2oOzg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=CWoKFMqm
Subject: [Buildroot] [PATCH 1/3] package/mpd: enforce tcp for options using
 http
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

Prevent disabling of TCP if some option is selected that uses HTTP.

Fixes:
https://autobuild.buildroot.org/results/59b0be79b1ca1469477e7634205f3eaaebef7d5f

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index d8ce930cc5..1b6815e904 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -204,6 +204,7 @@ config BR2_PACKAGE_MPD_CDIO_PARANOIA
 
 config BR2_PACKAGE_MPD_CURL
 	bool "curl"
+	select BR2_PACKAGE_MPD_TCP
 	select BR2_PACKAGE_LIBCURL
 	help
 	  Enable curl streaming (http) support.
@@ -258,6 +259,7 @@ config BR2_PACKAGE_MPD_AO
 
 config BR2_PACKAGE_MPD_HTTPD_OUTPUT
 	bool "httpd output"
+	select BR2_PACKAGE_MPD_TCP
 	help
 	  Enable httpd output support.
 
@@ -341,6 +343,7 @@ comment "io_uring support needs a toolchain w/ headers >= 5.1"
 
 config BR2_PACKAGE_MPD_LIBMPDCLIENT
 	bool "libmpdclient"
+	select BR2_PACKAGE_MPD_TCP
 	select BR2_PACKAGE_LIBMPDCLIENT
 	help
 	  Enable libmpdclient support.
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FC5CD4F54
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 08:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3804640EC9;
	Sat, 23 May 2026 08:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvuyH3_429gd; Sat, 23 May 2026 08:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 555C040ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779524770;
	bh=Xdi93H4iTsv9VOpuuLiKm+kYBpacwxWwURVvNSrx82c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=COkmtD/Ji61LE1agRn86e3Zlk/MrMoS7RemkDNDEI0Lg/XPXylAbwyG2GYyXMafxy
	 nY0m134UQFRqgnRHWblab6x1yVO0PA+Yl/894m76yh5ItxvHbLgOIbHqFPz5LLiJ7o
	 3rRlbWZa70sZ2D5mhoZ1gFoImNQhpMCfiIshS2NyGe59OjHmtdFJM+c+1iyf6hAH2f
	 8mGmwFJhxI6lW9J/Tw5ZPrD2PH6ypSlfVnQE6HeOB8V9vnmV/isS8rF1kMJA75YJyd
	 7t6YWlS+JuPfDmF3GZ+PTGda7rcQDol4urViNGnvu75o4agdx7kL4XrIiWRCnwsmnb
	 cZffCJ8v8yfRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 555C040ECA;
	Sat, 23 May 2026 08:26:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EC6A265
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0061F40349
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-ekOJ56QMf4 for <buildroot@buildroot.org>;
 Sat, 23 May 2026 08:26:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE8CC40332
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE8CC40332
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE8CC40332
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:26:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7BBBA4C0524;
 Sat, 23 May 2026 10:26:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49260)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQhgL-000000001lN-0R3v;
 Sat, 23 May 2026 08:26:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 May 2026 10:26:05 +0200
Message-ID: <20260523082605.39217-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779524765;
 bh=PFCNOZx7z+aubog4G2akA3QXSu70zULnfAYHDxP0SUk=;
 h=From:To:Cc:Subject:Date:From;
 b=LM66ZwgrT4tS3DTKjB2dvHxz+QYL6h1QplDZmAGLx630q6nQm0RBCMDHJPglh8xmX
 x4ZcNmRU9PMO6cHnS3Pxi2vtxFJYT4xFWNtAiQfrtamIGloSW9IEzKgViYQPqFed8I
 a4meHQMXn4uqn02fzQEGVKC1gGQ1KviUzDFI7xukkFrNnErEphTjHMCYEmw9aZldED
 1qo+A2PSZjVKxJ6IbIn6Yrtj8RWGgESg5DJ2tvLN2adQHaph3dE7KHabs5NEaBU37w
 WO8sKTwEEQtmek6P71SnYI2sxppQmyNgPiP5vRT62FeVt49tMt1zXHAW9Qj/bvxuuS
 ief/3rQPxKWwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LM66Zwgr
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump version to 3.2.1
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

Release notes of this bugfix release:
https://github.com/gerbera/gerbera/blob/v3.2.1/ReleaseNotes.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gerbera/gerbera.hash | 2 +-
 package/gerbera/gerbera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index a60017e8db..42e2d13951 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c55ec5cddc952e2563586ac76014be072c9dedb5094c6675889afa90b8df23e2  gerbera-3.2.0.tar.gz
+sha256  6b89d0c416b6d98e34634e5b1121f340315d60b088e9e6b2fca423488760030f  gerbera-3.2.1.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 1f7a0d48ff..bb00fc89e9 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 3.2.0
+GERBERA_VERSION = 3.2.1
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

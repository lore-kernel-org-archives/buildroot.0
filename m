Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D540CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 16:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DC35409B3;
	Tue, 12 May 2026 16:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Slz4IBc2uMP7; Tue, 12 May 2026 16:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7124407E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778602455;
	bh=2j5IP1HXaQzekgadM3ZI4H60RmgOIxGRPSdwkX59+sk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fB9otgPW+16JWqarBhcHYj4GUd2JED2oayqaXfdiALIkVr7Wh3YS0nHTGVUr2RwcX
	 neiU/9TwB+Hdt+mREOx9ePyioh/xlfh/3rfdHteefzVH3Z3BiHPcx/Yjb62cYVEzsr
	 oPR36oS2/USxzwS6RRIk72ooPoYld2MRGAE8jbWWTvgiAaMJYuOVVaIP1S1ps8XbIu
	 FpIKtUji+fCsmjmKpBpRgVLFZLUVIJU0XwiPxfivLq9VkT9FamPc//gl77SHCVs4uL
	 nctALS3aKq6iRo2CzxwhxFQhYb4Yz6Mm15Uk0dKff+KOquRchHvVVFm9t8Kjk6P018
	 dvpZ7O9qCn55w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7124407E4;
	Tue, 12 May 2026 16:14:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AD24223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C7AA812EF
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_XYi9d97iXv for <buildroot@buildroot.org>;
 Tue, 12 May 2026 16:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A265E812E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A265E812E1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A265E812E1
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:14:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D510A4C0144
 for <buildroot@buildroot.org>; Tue, 12 May 2026 18:14:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43868)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMpkH-000000001rA-10A2
 for buildroot@buildroot.org; Tue, 12 May 2026 16:14:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 18:14:08 +0200
Message-ID: <20260512161409.2874834-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778602449;
 bh=4LsPDK+bg2QY9cdSmr4Wn9aFs3u7HD+yHI9R3hwtnpk=;
 h=From:To:Subject:Date:From;
 b=a4Dd8rjXL6ntnTzDmr8NP88ccxyU5Qm449l7rjvMsQlMqtRiRTkgqP4ftgvlwf6oz
 7+YC11rcrHtJbXf0FDHb7PqA9Wo/q/uXofjon29KLoP+KgJQOnfo6hjv5wH6bvF5Fc
 yB3qkMmiTfuK6Q+jiH/3ru06X3tPd2kiG9xo5Yu6Na8MFLpdskszH2oZm7N7F/gFNh
 R8gqnER32gUen1Z9IBXSJJRWy3/o8fR26b7Z3u3f1GqkJ2U0ej22NbXz/Bz33BH43Y
 5QAxt8qTpodkZiPPoteBwU/3y3qVBdvQG/lUJJloH7OYpyYPw5LqnJYvyKvsIZEO4z
 UNhInrjPxuUIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=a4Dd8rjX
Subject: [Buildroot] [PATCH/next 1/1] package/libssh: bump version to 0.12.0
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

https://gitlab.com/libssh/libssh-mirror/-/tags/libssh-0.12.0
https://www.libssh.org/2026/02/10/libssh-0-12-0-and-0-11-4-security-releases/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 5a103eb593..8c40dea2e5 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.11/libssh-0.11.4.tar.xz.asc
+# https://www.libssh.org/files/0.12/libssh-0.12.0.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  002ac320e3d66c9e100ec6576e3e84aa0c48949efde3bf5b40a2802992297701  libssh-0.11.4.tar.xz
+sha256  1a6af424d8327e5eedef4e5fe7f5b924226dd617ac9f3de80f217d82a36a7121  libssh-0.12.0.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 56de66d6ea..017ff2c197 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSSH_VERSION_MAJOR = 0.11
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
+LIBSSH_VERSION_MAJOR = 0.12
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).0
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

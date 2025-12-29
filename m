Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C579E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 07:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D55B38121D;
	Mon, 29 Dec 2025 07:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRacHFXZanJ9; Mon, 29 Dec 2025 07:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F3DF811E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766995130;
	bh=ilnM9NzZ/uT5rL1rQIcXfDeyKamd5KMsDXQE8n7o/kQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gpk2C+NUmqQU5IZEiMMlACJVQdbQ8JUFrm+9T0h8zKhL1WSNDc6hdeG0CuZLGlLA1
	 8j3+ssEqtoPsg9LRFrCcmNu72vpxNFs2UZcD11URZrg+1Vg7Pnq/2tar0hSPwmf4bM
	 PmytyXZX5v6O/5E9nJj2iD+zaysGPgy/xZflhQN1bal//DnPvQT1h4TiiTi2tQGoB+
	 JFh0kxxlDlW1myts+NaLamytPuC9q3hGaeXdjIizu9yJFjRTPeBLsUw0YX6AUrR2c1
	 e0o4EeOQXX2Nd5nY2K6au1Aap+AtD/U59vzCHvi2KEKOiOQMyibH+HpJRFSvRtMvU2
	 elhiDQh4oC63Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F3DF811E6;
	Mon, 29 Dec 2025 07:58:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57D8A1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 497FA40372
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A08HhFEDk5L4 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 07:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3EBE40322
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3EBE40322
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3EBE40322
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 07:58:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E703DA4C1A26
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:58:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35216)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1va89M-000000002eW-0eIp
 for buildroot@buildroot.org; Mon, 29 Dec 2025 07:58:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 08:58:44 +0100
Message-ID: <20251229075844.525115-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766995124;
 bh=bnoWF2g1hipTa+xl70jy+rRvKzl3JtnmNuy3VkMs6iY=;
 h=From:To:Subject:Date:From;
 b=o8i86Zg/uP9c/dDfXR3kfFEHGeQHOZa1I7zX3mq7HLivOqIF06tmEg9cA5Z2agEHJ
 h/rkluvbvwEfpCLLw0Z9EFN5Iamk0lK0dYwbYFWvYy9TziWFkJqNkdGoML8hqZhTYQ
 xccburAa3oh309VH2FDunD4iCv0tLbWGMhtHQjtVSO9bi+LmjDEIziYMVzLC1okahH
 qJu1yU+25sDmEPHgms9DmmJ8AnsqFW+MwwtbXyupINciT9Tv32i/LNTmbij1jGP434
 QCZLHQFFj/kbnIv9QmBAbKkMdCLEdkpUXqXIAy55YZN/oJF1GfKRjmE638/1ijbkmF
 AiZdedAv8nlrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=o8i86Zg/
Subject: [Buildroot] [PATCH 1/1] package/mpg123: bump version to 1.33.4
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

Release notes: https://www.mpg123.org/cgi-bin/news.cgi

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 2fc0061476..eed62fa538 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.3/
-sha1  41dd15e29668a8e1372d31f327c8962a8ef6b595  mpg123-1.33.3.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.4/
+sha1  30cf7f77bd1704448db89af6a6d75904572c4dcb  mpg123-1.33.4.tar.bz2
 # Locally calculated
-sha256  6a0c6472dd156e213c2068f40115ebbb73978c2d873e66bae2a250e2d2198d26  mpg123-1.33.3.tar.bz2
+sha256  3ae8c9ff80a97bfc0e22e89fbcd74687eca4fc1db315b12607f27f01cb5a47d9  mpg123-1.33.4.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 5e55d33b72..2f04e0f979 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.33.3
+MPG123_VERSION = 1.33.4
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

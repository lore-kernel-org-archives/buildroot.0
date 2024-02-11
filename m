Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA9FC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC5EE4025D;
	Sun, 11 Feb 2024 15:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7wjk0zQwrTw; Sun, 11 Feb 2024 15:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE692403A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE692403A4;
	Sun, 11 Feb 2024 15:28:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F95B1BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D02982142
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5-mWdlHvuDV for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:28:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7836A82141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7836A82141
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7836A82141
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:28:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 954E7A4C0686
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:28:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33012)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rZBkq-000000007iC-1bnD
 for buildroot@buildroot.org; Sun, 11 Feb 2024 16:28:28 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:28:28 +0100
Message-Id: <20240211152828.2164674-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1707665308;
 bh=+FHwFpYDmknyhELkYS1D/1Q7vJRdYfgPv6MYm5h0O/w=;
 h=From:To:Subject:Date:From;
 b=VYGp9W0F/spsXDKLZ35I6Ro8lM4pinH5O06ZDOYdAi+JZm2W7BbuTLQgBo6ZOVwD2
 EAn9mKmfOoIk0hQCePcUSLiIjAYOrtd7zdexEig7H5U5AoqZ4NhNaFymQ9ZW/t4Xz2
 YdS6Emddx6y+0JvZGaRd8ceIZ740BFKL3TpDEYK3AWs0zPzj9R+kKLnfUutuTmXVlQ
 xMA7CccKFH+Z3VbQGAKSIrQAWjS9heUms6f+N7UkJV9PkSK/nLc9HvLkPXxuWT03dn
 hiD9fz2w6oPP/+6vujrUlp/yD4IWn6i+ox0lkp5n0+/Sqwi+v84UKuZIs63DN9jny8
 qpljN2D6fh2Zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=VYGp9W0F
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.19.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Release notes: https://www.samba.org/samba/history/samba-4.19.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 81e8a6f2e9..3353221959 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.19.3.tar.asc
-sha256  280553b90f131b1940580df293653c9e9bd8906201f5def6e5e8c160f0bfac96  samba-4.19.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.19.4.tar.asc
+sha256  4026d93b866db198c8ca1685b0f5d52793f65c6e63cb364163af661fdff0968c  samba-4.19.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 42bcd0a928..78c5db308d 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.19.3
+SAMBA4_VERSION = 4.19.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

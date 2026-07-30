Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0223CC5516D
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 18:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6D1D40C28;
	Thu, 30 Jul 2026 18:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2DgFGgBtW6m; Thu, 30 Jul 2026 18:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD4F40CC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785436543;
	bh=Z6llyWxK+xJ2S8yUSFNPZf3II+sIF64FVSrmg8dIHvk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WF3tOOPJbk9CPAMFyckbKbCO/+WCx7I8EhQooF1sQlO5+hXyInWDwcu6krrd+OmZG
	 BP4Gq6+fWkjXlmkPaECRkeCf0QrKVcAPQGcgC38CL6pU/JSimAy4DbHHrB0kFHGRBI
	 ntCNe5WXnVvV6LzTHxiJ1JNsb7zNVcKUBYsbTGLEcqDiLvQEf8jNkcGKcdvgLUn69p
	 BRhKj3WYtwcymgd/CcRfYeGoTWgNX64mAgxOwQOeGO29ki6TYlBskTbZxN07DYhbUu
	 07wmd5CXZNYF7akxTjESW7GTWeutebKhPQ8kn/D/KRzakLbFL9RKvkrGAoRM+4x9A2
	 uQ8BejCs5mQXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD4F40CC4;
	Thu, 30 Jul 2026 18:35:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D27742A
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23A90811AB
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCrQ2wcuaXKY for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 18:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCEBA8116B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCEBA8116B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCEBA8116B
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:35:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021a.dip0.t-ipconnect.de [91.58.2.26])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C173DA4C44B4
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:35:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37962)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wpVbI-000000002pO-0RAo
 for buildroot@buildroot.org; Thu, 30 Jul 2026 18:35:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 20:35:24 +0200
Message-ID: <20260730183524.1145030-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730183524.1145030-1-bernd@kuhls.net>
References: <20260730183524.1145030-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785436524;
 bh=LaM6gid0vbzLPPmQ28J5cyqVOrNBcc1W6RYmMhcjt0U=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=UyoYvn2vgA3ebH/Y2W7bpXWs2wHFdLdokN9m7FX4uedvl9xr53f+XAi7crcIKMbkm
 DbpQVJwOTUY6vt9Totrf7NJuGVSvs4km49+bG8R2Bt8uku6Ylp+0zTg2Q/iqG7PFMJ
 vEkqDmwKQA4M5/zwsc4NK0YJEfb4ZpbPiu4hAWGRF8Fz1KIom99aQTwmpgTnGu2RbJ
 l+yjq8PHsSvaUdsqnsDQd4aok0zR/nTU0FZSHxFL9lz2kUB/IdooH8RHHRJcfnwm0/
 TS1k/qR2cIC6HUroRjuy6EKE8O/CuSTQ6S35blkW3MMDuI7CL9NBfhpgLGYfbt+4ZT
 p8//3gXTvz3SA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=UyoYvn2v
Subject: [Buildroot] [PATCH 2/2] package/php: security bump version to 8.5.9
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

https://www.php.net/ChangeLog-8.php#8.5.9
https://news-web.php.net/php.announce/500
https://github.com/php/php-src/blob/php-8.5.9/NEWS

Fixes CVE-2026-17544, CVE-2026-17543, CVE-2026-9672 & CVE-2026-7260.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/5863acb2a11e867482af8e69925021466a7c6e2a

 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 3c18506359..c093ecdacd 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  58910198d19e873048fe87cdfe16bc790025417ede3d1651bfa1c4b533d573f2  php-8.5.8.tar.xz
+sha256  0db7855f25bcd0ab1d592cdb35e284d6f6a5d2ae0f6f621122e364cc39b708f4  php-8.5.9.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 0e9e68a5a9..05eb4b9092 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.8
+PHP_VERSION = 8.5.9
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

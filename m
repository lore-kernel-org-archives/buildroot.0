Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B7ACD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E650F40C0C;
	Tue, 12 May 2026 14:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhoI8-33ykdi; Tue, 12 May 2026 14:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2186140C11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778597535;
	bh=Xpo1TSSAN/DFc0npL6ad9HUxKLjr6HikyMz2DXMbLXI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FhIFj1n75bJwFn6ivIUR0DYwsye45STVTpMHaQxpvva/BRHIQwd8VZiaI8BdvhJzF
	 HSVC3y6bqmR0/PAyoCzYEcfg5Z82tKQPokANqHGiN6Vue2VU1JjyBg9R4EnrTpfdUU
	 pAVP6qGZ6AAee5TC2Cf8PBJpns7eTxM0duLGd4/LM3Mw4w5JaiWW8gk7M9t4pzok3+
	 jvDd2jfSAyDyRkiNvUnZH9giL1PElzI+PncNHHoFETe4ISN5PJ0oFwnJv0KSoUR0FK
	 gyElrzr0axU6VBYwhKBB6S5gXZCvcfJUaq6Ch+5vT0nkHbdwP6I1G+WfMMuWRZ1ZuE
	 5tQq6z0YcX/JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2186140C11;
	Tue, 12 May 2026 14:52:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8084223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE0714065B
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymrGkR4GO8GH for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:52:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 980DB4065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980DB4065A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 980DB4065A
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 78D58A4C0445;
 Tue, 12 May 2026 16:51:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45106)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMoSj-000000004ON-0fpl;
 Tue, 12 May 2026 14:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 12 May 2026 16:51:50 +0200
Message-ID: <20260512145156.320992-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512145156.320992-1-bernd@kuhls.net>
References: <20260512145156.320992-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778597517;
 bh=PtXzETDC9XSd/ya1RExhLAdDrAtrlsjfFbmpXwgcdjA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PEv51zk2qFR/UyNpGkF020WcAW2wV9rV0mw34wh362npbaNhB4nyBrneZJKsOzx85
 IvfZg1nnIedER4svR2ccvdk4N3Y+eTC+YpSyH7r0RYILV7SxYZc8VNl2AgDXjUOiIO
 eplHLlH80jMe3wrFy0IrIsfJ30xA7/6QxSjiYU0INQdHBI7bI6Z0rvh1SH2YC6hSDu
 grTh6eqJXm0JCjS67mh3hlMYtvASRSF97Kz+jglOl8RJzoSUd1FQ2+U6uTUU9NTDVk
 oGKS6Wkvtz15xlz7NrgxouHbTAYmuj0ZET8udSyKvePZhZZs7nuPYCWkYozTurRb3i
 gsrqpjJdbER/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=PEv51zk2
Subject: [Buildroot] [PATCH/next 2/8] package/checkpolicy: bump version to
 3.10
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

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index 442ac883ee..302122426b 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  dd85b0173ca6e96b22ebf472bcbccf04eb10e1aa07add8f1b7e0e9e8e995e027  checkpolicy-3.9.tar.gz
+sha256  2d92951dfcb090d6179e7a23856622e0fcbc32be03bf1e60ace9dc9cbda11e59  checkpolicy-3.10.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index df3da2efdd..abeeed1033 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.9
+CHECKPOLICY_VERSION = 3.10
 CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(CHECKPOLICY_VERSION)
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D563C982EE
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 19:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27B5880D8A;
	Mon, 21 Sep 2026 19:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3c_oiaWxo4-M; Mon, 21 Sep 2026 19:19:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 41D6980D9D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790018394;
	b=EDZ3l+tFL/6aI6vqrt3XR7ZDOsDRNmKwybLqRiUanLnsuWQb4ISsdCwkveKrjwkcPaDI
	 ocVZztmvgQkbZE4lEyhZlb6VeCT9/B89uq/xi0rDl2OYjYP7OZBhBq3NJBsxUBMkKjCDt
	 Afp/pT7rOWVppdJGayamAkprWp0/hBzPe+VLP31dwm1t5gV2Dx+mrjXjlZfCaUrL7pjZK
	 z3gMDrsMZD01WVlUeVR7zc5cEk32t6xgZQx+4t1jWaqU09lBC/KeL8WFFezp/jiKE85Gu
	 zuyNaN1OWlLK5pCucz+Z20SOSxjGosvnVh5VT7haEpYYxXsPJQdK6Rpz8go9RJRBCYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790018394;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WvpsYMBtoTLbzjRbzu028Kc+l2Qz/buJfpPis8t6qGE=;
	b=Ju/uQA3qGbEe8Yg6VI86L081BYB2q17tp/9kUYM3f4Tzzf5/5FyM518q8VsfKOX6Y3o3
	 QuXI07qXDCrMjUai8uBKcO8h5s/jXAH0QeioD8kYYL0dOIo91uvr+hpxgV0bl3nZbAys+
	 77YKR4VBVpImXRiIj6c9AUotVROmP6O8n97+BUyo2XhrrQA8UKUCd36CNBqf3vhQ5zwmh
	 07Ub1mqzCLMz68T/eP+XCRxydh3gzToemCMJhEAsFDQtq2XrOZKu1wYpIpVGTiFlheXID
	 11SIY5W41XI4d8zd2TQAPj/a/M0UR2mGnPwV0hC7QZcdyzFfxYuoDyB2nH3qHphIcQA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790018394;
	bh=WvpsYMBtoTLbzjRbzu028Kc+l2Qz/buJfpPis8t6qGE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LMYjLUg7NWe4n4b8Gs4soRjfVXcqEt4cNG3sxT5u/uWmCD5sEA5vQbmbPxCE0A2t7
	 ukh0dZ3e7VbryCLDuqmAendumno1p0jcEQXtraamX1FeN5AnxJnx/VshzBCsgZ4fNI
	 Ij1caVw6JVj3SokffR0J7rDF1PfskTT8oFtYOWVp6SiN85v2GnorHAPPg+DZgGizYB
	 lA4jWGuDncwJyNitdigDzdiMdZnkki8us82QSu4qae8kMo5dVriLQLX1ItW7sfIFid
	 sQS9JzSnlZNwqOxr8wtAqy8nbGct1kWBvE8G8H3ld2637SuwJLrDcJa369FwDK+3Xj
	 YC40Nbf45XuCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D6980D9D;
	Mon, 21 Sep 2026 19:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8206C13B
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 19:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67FEC80D9D
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 19:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcMckeP6Q5VX for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 19:19:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7351580D8A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790018392;
 b=UfoMOaFKMk1e297xOvQihGy+R+teUDy8pngR20Yytdw4NYZmpwAEv/KpAkbX4hQVh/H7
 7F1CYz4c6a3hi4BqMla2niZbXvtHpXahCvoqe8bItL07TB2jZbPGF/VGsYiOF89vxR3aB
 VRzkBKlFzIOAQ0j4DUg6uN8htCC5Uap58NdN+u3AM3KwoKMIURaCf3bAmYrXPCxMwcCgy
 Pl8tRUji9l9mW8c3vCC8ju8ZcyTWPZSF+Dur9up5nBedbapydrfs5gDBAbPrOKVVHdAOJ
 OsJHBU8x4E3nn9ESDzANtQT4EyjdmGdpk3AaVj/RHyyxjmFLSSnnKQHKpK+v3UjkBhg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790018392;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3HbN0A84xDWIcAK3to8z51vwe6feSWhgzdxB/36BXsg=;
 b=CIAACAe1dYcW8GFOCv05SfS8Yo2vgjPs7N4JM6F0psBNxV/nMSEJQvWOaGcAau4Y0OTX
 CmxxFvHHx7B76GFthbOmmqAYr4RVqWn1AGce/pCbXaHg4+cqKc8J5R2UIXIMNMkkkP12D
 JmpJUI3AJ+jgtKpDwJ1cTxOK5pPgE6yHnnBJsWIDmWzD/J8yAQQMrw3sLN35v9E4XFkqS
 G9F48Qt0JI2iJQlrZQQHT8UGp1SV53lxe+f+PU3HRz3rFrWigBBgsLcxBNF1uhAkVZVA4
 a9Otb2fA35hTyGcLFfe7qeDdeMyjWDlbP16qqqS3wRj2QhAoxUkXV3sI+Dw060JxvWQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7351580D8A
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 19:19:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7471094E87; Mon, 21 Sep 2026 19:18:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Sep 2026 20:51:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2c69fe0a46294615202471f200390176d7e3bda
X-Git-Newrev: 45f1c387e0b7a9e9e89280261e91803339950822
X-Patchwork-Hint: ignore
Message-Id: <20260921191843.7471094E87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 23.1.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45f1c387e0b7a9e9e89280261e91803339950822
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-23-1-1-released/91760

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 35aa544014..c7e1a8bff4 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.0
-sha256  ab1f0e3ec52448c33e8782eaf0422504b87c7b016b22514653ee0d8fcee479ff  llvm-project-23.1.0.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.1
+sha256  ebe9be46fe8756d58c5b198ffad0fa2a766257add81a4dc52179bfacc7888ee6  llvm-project-23.1.1.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 31b2a4dae7..850bd78720 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 23
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.1
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

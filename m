Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844E9CA6004
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 21:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E453F40B1F;
	Wed,  7 Oct 2026 21:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmqKkQs-HYjb; Wed,  7 Oct 2026 21:16:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5F99640B21
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791407800;
	b=XVZQiwYqG28I4IQZHYY7LmQqSbjuQsMKk7UhIMrI4dHt1uucPKtzCeYCC5sBUMbd3vME
	 OXzNsczbzZ8A9fFie18ipYLpCrRnAH1jPTHl7mfNM1fkUzsffNIZDrFGVPZ1dJ1Z/nkIA
	 U+IgrLvfKkiUsMjCIMYRwI0P/FS3UrtqwO+lthDeEDLU5YqFuA4IiF1ZXcB4DSR6hgzlb
	 fEdfR9JZXn8vaiUujwKy2pNd4+HvWC59BcMBcIKGXnpYHIKJlubK9oQNAVaV8mMdX8M6f
	 5pCS5xFI6WK69ycc32hEDPoqx27pP1tfNG23C48/8lgIuNjhhRjWV7rPluq9iKi6uBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791407800;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZcBAQ/sbDkIQzYblI7F55ls16oBz9JYYAu8dWWS4YwA=;
	b=NknBrlnCQ2TgZHEvFsWejUOvUxf3OYx0Sag4P9rSWuXAJIxPagz94zXNcVI2SDh10gfi
	 T0W4tmwri8YSl5FiLYnKEdYvauv5FABHXTpEXYm5UPvjxeHTvZbU3/FFyJeoLNzyzbBaw
	 5XWPgaGJo/9fsRS33PS1kkSO6zG+xI31xSukxeNpvwTqOnLentVqN7xb4gP+zaH8iPWGM
	 bMkyD9KK4QMS6aaW4fyygVpsehRQiwbAzi/5LMeuyQdjX5RVuN5riLjZIZf3YkHUHxQ0+
	 bqPhpVK+neT3GNVMWIru27NBLI6hlf/k3q56dcWLo4QiX19RT7MYwmIGgIlfff1wiPg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791407800;
	bh=ZcBAQ/sbDkIQzYblI7F55ls16oBz9JYYAu8dWWS4YwA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G+PVu/LtWRm1KlNlKvyrPEs7qcR9E1BfgrCAuoocjo/XFP4qnBCIEYGHurDwzyGGE
	 py8FW55wSEdx5l9iP+w8VFNSlS2rSdFORYTAlR0rFg3YpXoGDKQMvo+Qi+crQL0zEo
	 brJFAK+MGKxAtpedLN7jb2EgyU3S3uqUKKOOTzrycdfVtlwdUY7pIAplW+9mXrI+I3
	 lmIymYN/74sRGem7+FeBLx7N1dt8F7n41OV2uFevEVyE3bx7FFIcBS+JeMOclM2cqh
	 U+Kgy388xxtMqdCRWx8YqxCyM8YIuupCs5W8HsqUl6cM7zizdyxXvtoUJfRYCiEfJ2
	 BgBtCzj9goxeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F99640B21;
	Wed,  7 Oct 2026 21:16:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 331DB22B
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 19:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18A3860887
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 19:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltw4Y4g3JYMO for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 19:59:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DF93E6087F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791403182;
 b=smf82YOKNfXztm/Fl34EVnrhHd/xncQb3ALRj87Vp1bM364ukep1yVQoeVrpD8da9l9r
 Lf3k4TRqwXBfz/PzEhHO0wF4aVEOBmXhZr4Q2hCXYKhv+Usjp+tQT5qtYvsb2N0GNU+TN
 jaIX76pKi4Mw0nbPkf3z1UlwhEevqyHkGCdzXOI0bY0V+6W9506+tfmauS5y1b44hNT6T
 +Oq3xJTiSnUqeghSg112jydQ7NbqgKwjPliI5t+EzrhSdRyqD2oGRH+inm2FSugOpDav1
 KSAtGmDQhwLo+ETVtNfaIypGHMcl6to9tzsXNGVIcnMv1BpTV47vrlUUcNql1fa27kA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791403182;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=filnBUo02CASusy2SiPyxSbD0KMNvPrrRG2faAz58Xg=;
 b=ryPqi6rqUaANrvxK7ff0xigQ7nLO3qkeWRX+Hk5XJtX9FvgHHBVw2m7auIRfIj0bUHBq
 YQvN8oZsnid3t+B5OvVz2HhnBuBNbRGvL6psRryNx8+UBRpTTiiOyMtglBHza+0LLBmi3
 PCoNrNsJW6xAEPScte0qs+Aocs4ThiJetM27MBkotBeIS/ZpYB/6n9+Igbg8rEDKa5vSD
 mocp0aKEJfhGidLYhWYkbkgxdr9j+MTcuEA7ngbFwEN3khrxmKGptN6q+/cPMLzjcfr6M
 ND9Qz2wU+7icIt5su8qxnbn3ofynj8dLAryCFTeZPFwGOIuiYSuYV8T3daSCJbMtvpQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="qt0H1of/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qt0H1of/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF93E6087F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 19:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791403176;
 bh=filnBUo02CASusy2SiPyxSbD0KMNvPrrRG2faAz58Xg=;
 h=From:To:Cc:Subject:Date:From;
 b=qt0H1of/UfqTtDP7VJxF/9M5hpxB+vKZqnLOU7P6SIJ+gvxz+zus1Ha7O6BjQNTsN
 auLLfU32bhSOJNEbTIEb2g7GXhorQ3sUH2BGQQ55WqZuNdTEXZe8tipMa+BvaiCKPO
 uJIK+g1b28PgaHpA3VBz3naQp9bwO4V88B/v220VPF+dRadDy12ubT9Hiq4h9yJc5t
 EXzOCbqFyd1V5bZg8p0xweRNbq2Uob6GBIIa7kQXFhlCCDpbYsa7P4MzodqqFXexIp
 UJ7X9XL3ueuBvb4X9eBbyJGveYs+J58Awdq0CTWABkHnKnSJUgIVFfD5zt3/FF8wmh
 YB1ZMuEDCiJ5g==
X-KAS-Sym: v3:f51bdf72230551df:hUM0Pyqw1W+WqpUQf5k/84YIre3r/yqBpGhMISV7GJlxN
 Gztc0wxKxXDVCfFMPcYifzHWDV4yhrmtGkJyzkTutmbcPSpUA5yfHtpObN6l/Z3b2tHaGB9UaRC
 taac+QH8T8KX6dUBgXdcok4wnN24JsHqdks8mqn5Okxebgq2HGn0DSGqF8ktDQe/WUaw5SDAAUY
 oIfKA9HHlDXL3EMh1j+Ah6eZU2zDOfUdHDoIPxjwi7QORECFi6UgZrdYSF5Ls4+puEVz4B8bzSW
 Ty5K51Cipj04SH/Yshoy+qUkUQbf7GMsFZzX7w71Uw7HybnIZhG3PFt7EEDdPHevr84cIaXQ==:
 jzefxDdlkUnb+nCoD4NnOZNLBVAIln6NNiLJU9HSbdZi3o2QnAIUWQrT81AbZIzAZX8pd8PVKpS
 XL0YYuHyMI2pBhGtPnHz8IIS6rREct3Tp3bvPEQ8UJ4Tq/fxKn1qTtL0vJBiV8GLn24ufgXDY8o
 mij6MfTx7no7nyjA/0l8lUm+oi8Of5CQPTuUlfqRxgS3KyWcbbY5CPjSAGelmqnOTexMcMr94ZL
 w42Sxw8OinZAq10g6taySDWXEoQgzlFZ6UXQBHTAsWB1qdF4LSrBMfaPgCRzEjwJlJ4VIct9jQ2
 btr1uovQLH9C30XLC9Ev++Ui9wZA2NNVLhV7QNV21YeP/EkFQJ/6p/5mK6bQV6qZL/jCrr3+JjB
 cyGJEcZuhzZ6FWewCNXlcIWkz4xK/iZ0lPqdwO2kUM1FMCAykfon6daZnjEd91CnT9ofpoma9OS
 gP8hdxjeCSRMdY9YUrYZgjq6lFQkKRnaDD859apdzbnfjluXm+8lMEEg/O4mLY9Y0qwJqnplj3X
 6CMKxNz3fRj615Pb7edLvGLTNIXp9+BdyrmtDunD412xCoafWrhQiz1P+JAV6PvZiV09Ok28MEq
 a45E93BqFeOqzdgJ0z/nePgDEWEIQixFIo147zuql345O/RbWM022p226kpXeWJXUcosfvIjvR6
 7Nd5Amq77nzM8IJCr
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BEACCA4C344C;
 Wed,  7 Oct 2026 21:59:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60012)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xEXnc-000000006dU-0zgQ;
 Wed, 07 Oct 2026 19:59:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  7 Oct 2026 21:59:35 +0200
Message-ID: <20261007195935.1615148-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.9.0
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

https://github.com/libexpat/libexpat/blob/R_2_9_0/expat/Changes
https://blog.hartwork.org/posts/expat-2-9-0-released/

Fixes CVE-2026-77214 & CVE-2026-102633.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7f94443e4e632c515950d3489c6af67a6d4ab81d

 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 262ad4bf0d..41778fc536 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_5
-sha256  1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182  expat-2.8.5.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_9_0
+sha256  1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051  expat-2.9.0.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index be4180992f..be5d8ae0b8 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.5
+EXPAT_VERSION = 2.9.0
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

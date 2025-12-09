Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771BED3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA4E84779;
	Tue,  9 Dec 2025 19:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAYAerlnA3Gc; Tue,  9 Dec 2025 19:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 588F38440F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309365;
	bh=uveDtSpje4JECDwLJGuAztBp3MVyHlN7N/WhsNvZUS0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oKXB2jLp12qEacXjAMrxCknkOp467iKhGHbXq80Knj/QDQ5qEbVl2Z/fcu2s8gM9s
	 rPWXNQmwJXvGghEvgqIrgF1yDDlRWc3JVQqKAQShgH+Ust0HfFm8qL5rhH9+SGBUa7
	 xT5RLS3DysTTdsHEA1t/7CqkUOmOhhz7xizAHUF7VeQY0WYgI6q2gN7lfxVywqAw+e
	 U/iWVVsRc3y+U4VKeEP/W0i/6VRV4sjc1ESHRGU7P84Jic87W1cqQdQSeFgQFEfhaj
	 0Ye94Fh/0MrArPC3fVwY7WCLnsnFFZ4UcLg9bP03xfkS+XM+1X1mTMzQa+l/fhPL6R
	 +S7gUwGJ49iXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 588F38440F;
	Tue,  9 Dec 2025 19:42:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 964BB2C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88A0A4059E
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZIuPI-k_cBG for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:42:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 798F24026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 798F24026A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 798F24026A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80F1FA4C2C9C;
 Tue,  9 Dec 2025 20:40:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-482e;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:34 +0100
Message-ID: <20251209193951.1000100-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309215;
 bh=ij2ibN6t1Ps8VhLG8H0RdLR3fVl40jeOChGQ28ltAjQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nuPlenycrC7aze2cjm268l1ZFvwZKC3EQ9gBUio7EsXs4d72LrSmQwIPSFRKHVnqk
 +rECpQ1OzBhJHpKV9kUGYa2/tI5t9fxjmHySVGzbWQxcg9QhqMfaXMiUxC+9nBVlpu
 wHTOemspd6KlqGQYZ/is4NjiHWHmVwHdpP/1iHUfK4oHhi/FQ3uwL8lxS1pOJnsxI3
 TULLQ0qMygMD6q2DAVC6K3bgfdSTNamOewv9vu716HVjNQhgZcOaP3ZyBc+kCKIzEu
 k5/op0MHIviU8rRUkZnHbyNeAi3dskfhgrge1lX2qR2XVSll27nXY7qvXmXl9LhCis
 uHQSqxRyknGvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nuPlenyc
Subject: [Buildroot] [PATCH/next 14/31] package/python-attrs: bump version
 to 25.4.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.attrs.org/en/stable/changelog.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 95b0a63bca..bf2aae1ed8 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  338069d6f69126086d589b2cb44f4c73  attrs-25.1.0.tar.gz
-sha256  1c97078a80c814273a76b2a298a932eb681c87415c11dee0a6921de7f1b02c3e  attrs-25.1.0.tar.gz
+md5  6197561dfec99660529830edcfeee0ba  attrs-25.4.0.tar.gz
+sha256  16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35c57e11  attrs-25.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 74d0c2f8d1..fd900c5046 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 25.1.0
+PYTHON_ATTRS_VERSION = 25.4.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/49/7c/fdf464bcc51d23881d110abd74b512a42b3d5d376a55a831b44c603ae17f
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/6b/5c/685e6633917e101e5dcb62b9dd76946cbb57c26e133bae9e0cd36033c0a9
 PYTHON_ATTRS_SETUP_TYPE = hatch
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

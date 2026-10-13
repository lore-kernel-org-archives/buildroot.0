Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104ADCC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC48780BD6;
	Tue, 13 Oct 2026 20:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7meSR8oTK1gX; Tue, 13 Oct 2026 20:52:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D6F7580ADE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924758;
	b=MdmWpcUkjILcfuAHzpxaKqU8CWKIsW00UKZWTUyOQrk1u4dO2wD9X9ojZxSvtWo/bpVh
	 M5IHuir/KQ1nXbtMajwK2NsPdGZd/5SXKcI+oX3PbDypCjLptEtnxOwHigOEzAqAxxOzC
	 jB79n3xDA9XQgp8NUHKF3WhUjpgD2lIcEPLN10vIFd2VWMtSgcDiP6baiTNSRO7KJHu/R
	 K59PG3bDyLYMxtppvgQrSwGCT36JN4r+NuGrH46bt2ukNusdB8BhKwDjAveE+3GwIEX2K
	 Z7MhQfUqdDNTQpffnNu405EUUCUJmkDKiSQ9UgBf8xJIQXGYOJ895x4ynA/hyiLt1jg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924758;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qsQ+ZPCc5bv0NdKZTPGZk7EY1mPKRFboOyhM1r5S8qs=;
	b=dn35PIHBJGO/RiS6MpOFnRKezZxpI1RdLyuUGxth9FCgfAEGsJgSO+Kv+iy5NAhbkua5
	 sR+qcY4P7J7ozffZl1zTljQK2YkPt8vaIc33eBSSCH5hl7HmgbCGmIEPdxy4fuRSVW5MW
	 n73+RMQ7quotGZIPiHNfGF8nUeERIxasvxIPKkqIKvuJHzvyZLZNrJtQSjj4WCb2vh4Dq
	 4sdKOrW+MfhoG8T5W0pVXgEnRJ/D7P6H1iOXIJFn9UTN7dopIalihSQqpn7M3ww+gmkQL
	 W0q20RKtlMqkKhXpLxznpRReYyofaKTs1njcCLDEtCeOe88hvB8LwRqwk3gBHN4UrXA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924757;
	bh=qsQ+ZPCc5bv0NdKZTPGZk7EY1mPKRFboOyhM1r5S8qs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=daSuaI+wCct/Ys2S/xzwd3SXP8OuIXiduHkOQyhdSoA0d/0EFCJjqSSzX2BbW4c84
	 5h4L00FYkV11elVGNPk3XMJkWmNXhFa3ULU3QLoO0t5zXw1uCh5wx8WGG4VcefJuWo
	 KphmHjxOmhPbvEokhjrVf7ErIeT7x39xnD9TMjvSx+6gWqOtC+hfYZfJAX04pAjGTz
	 7uu0A/GnEGiRREo8B1pHXwBQyqjbp8UQSxRX8G8hosDFgcNQXnmLVO7vgm3POYxq6s
	 TltiboSmracjWeoQIfLSzvOlxpy2lyPEDM/CjFiEBCP6GG2pB/Yo1MTRT4+PUndCaK
	 Zg58YAsEhEx3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6F7580ADE;
	Tue, 13 Oct 2026 20:52:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DC4213A0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B9E040619
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Z9xgtST1zAW for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AB8564062D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=RzIra+fsvBQl8j9y1nyjOWBST1xDpwUInlQZgUmllr/8Vxn+N9zzShJQcB49XGC0+nHm
 1ZcbNx7SYF8v9Xdyu2ohPGvog8qw5KOG1g9Jkhz2faTWM20gAf9UBB5+Fpw0bBpxPS/ZV
 QRxAhEknrQiNhpPZ6BaoVDeHmbqaSkmI6waEOR2IVDy3NGJglIV3vgxhGepFPptY6OZZo
 T/PO1j6pEZtFvVU3yBZDi6Y18bIGksJ5iDcCs7MUHMHRRcSdIjAuH2tVZAq2CxUMKCp/9
 R9klowAugB7mOYtAoeInOemibms6gCPejTK70UKID6CE3DZSCOUZ9TB0OjtUmW1pXwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WaTVJswztiBDxF942U35BVDzPTmMRHUDmRzyXKo1fvI=;
 b=IJkgxsfb5tyfAefpiIpYvEpbN2PB2tLWaUN/hIlNUEyHUUMW20AMLfuPFj0oVHWvnt5k
 nDjqoHfPLroKP+3iaamN4zuohfl2P2Achxv9Jx5tiSAY/4IW6/bITu9ZH8shVDcFJRmuY
 glkOqde3r/6zAl+7dQp3KETXx7ro/glFpPfTQ5PD81aaMMhQlWyB6CbN5A1lYYM92Lbow
 7pqZUkpIaSz0vm9/PGMtbdzsFBHKML64t6rsMssw9j8f838zPegkl2ahc75UHg34IhS+8
 jSa7pX6iPe8vSbR2PiDHRtB81A8kJYGwCsY7v/0RzePzU0IUV5meBrBKxf0dDR+b+Xw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB8564062D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E59DB956DF; Tue, 13 Oct 2026 20:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:42:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1872f6de96fcf1ea0fee4f5a7cec4b339b271c37
X-Git-Newrev: b75d5857d8aaf40e0187f33616fb332d8cb64c71
X-Patchwork-Hint: ignore
Message-Id: <20261013205105.E59DB956DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to version
 0.143.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b75d5857d8aaf40e0187f33616fb332d8cb64c71
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index df667dca2e..c59c623df0 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  8cfa79d6d32628b35a90ad95d4ae14aa  fastapi-0.142.2.tar.gz
-sha256  06366626f2e70576367714d9ab2fe8472e6c8456dba69b399f9f797ab5e92570  fastapi-0.142.2.tar.gz
+md5  1bb72b474ca0981a837e4237a0ab402d  fastapi-0.143.0.tar.gz
+sha256  1acffe48206a80917cf7dac21992b5c44b25384e8902bf745c1fd9dabcf6c51f  fastapi-0.143.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index aeed93022f..7bda802199 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.142.2
+PYTHON_FASTAPI_VERSION = 0.143.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/56/4f/f7c30a73127e0a8bbffe788369b8359e530b01ae06e2757936fa35bc5e6d
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0b/d7/6a8753ab6c1d432dc53703c3e1b92974a94531b7d047c32bbaae461ea844
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

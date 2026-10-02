Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9912ECA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 21:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BA4760D9A;
	Fri,  2 Oct 2026 21:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQRyvuUUYILA; Fri,  2 Oct 2026 21:47:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 85AA0605D1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790977653;
	b=M4bgRorFjKbG3mEG5GEUnNxqY8qOw7EOmJEplcYeXDLubCI5s/WfdSciZGFbUqvU+a6k
	 1SnZgRDRVJUgv7TBoPaGsStNEBvOHGZdfRKN140cQmw5+aKi66NTXsGo1PZJ/jkQQh4sk
	 5VyrpeOpsZyq78LU/4PAf3Lqe590F2fyRRfAy+XxEL1vHGUB6WO8AK1ogGEPgjMToJAcK
	 hJ+4ZHNmLWnedFgkkVhWlRo6h+Ib6GH0k5PPViMmJfpqSbu1PTuSdIgkPj16+OCorqaA+
	 WvpfNaU5oXMZ/IivL7AVvg/6HWn8L7M0NmroQ9qUKiO/Hmo2ERAzJ5MsUIFuld9QYGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790977653;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QtqA+bJEgoewSWHSBDIXxK79GZORrLo8Aa8F6n+AI8k=;
	b=GdMBAKMqKCSuFRWNaXeCDUVKRgbKRlSeH5IenEs4XRTL14A5/sjNMGwgvu+eQwMuombc
	 2HC2eNs6WFBFccgyN5mUJ6tUN6OuPC2PItr1KJUh6W1GBYZ2MzZJepPajyNeElWuIoAnV
	 QnVWoAzNEn2kqLRj0YyT6Jzj+dZmu+AVCv3sMPLbrQTJJe4RiHSfByo3ARkYyvfiokloc
	 rOR1cDlKl2LwRDozKWVicYZkfg0FCBm/qzMR4NLgb2tu3SdXdesMefUgpYqzZDj4blesL
	 aEl2Y31DHRTOO0GEwXJENURPYWLYmK0RkcbOlUzood51kfIbk1Pn5We0S3rAK1MnpAw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790977653;
	bh=QtqA+bJEgoewSWHSBDIXxK79GZORrLo8Aa8F6n+AI8k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhYD9QClzcrvL6uHOMcWS8shXXDcJbpc/8NE6Sv952rrk1YWOd+AKU/4N5Kjmc803
	 3UcLo606eYsPkTxpWgyMBfitJXg87jDY+xg1laU6/XUbxUAv6m0ZTLNpivwLZ5n0Aj
	 YOXZ0Kg4jBc7EuGwdmOJfZPfONnTxVfsBCxsRbs/J5b4vhS03E1tnzJ+phdAl21G3q
	 wntkAHlW4rEZMj82ssnGfvekm9BUaRbfeHv535a/EUZlkQ6rFW1CLGtBg/9MW7A9bf
	 uJUoZYbw0y1nJZk5Nhh3ostgAtQmaCR2u3xFf1MZ+wRXiVB2RdSJWDGO9u0CX+mxi3
	 rCq4bRb8jKOGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85AA0605D1;
	Fri,  2 Oct 2026 21:47:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F23C534E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3FC2405F3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvyA9f6WfDA4 for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 21:47:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F3662403F6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790977650;
 b=gb+vja0m8ablvFrnmzGyNUWzPYR3WGA2pOCxiKO5TYjSLVkdP+lbdy6m7I6KIwl+fxsM
 yzWsVrLn3qFLv9ad6oze/rqdbsoFVh19YTYchDhNI/RaB4tqeaQed+5gDUiSAzg8EPQ6Z
 TD6fdShL+Z0kZJfzGTcCSvw0GRcGFbsL/X9IDes8ewBR7FBoObUhwvUWpgRprB6BL6Zwj
 q7mt1knEy9/bBL/LMcY7R0kfEBqkZIvSD1E4Qc/2gTO8ntyv4DfkkMqJ3TL8o3kXiGTG7
 w00K9529qvYgglatCHaaAM3XIWi8ufGKnc/GFSl77Tkk2ULOadMVYylBgiGv7rVcJMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790977650;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=9kb611CHIKP67ZpdYPVKfINDz9g4tpCnKlgCQmervD8=;
 b=X7LdEad2gJ12qfGxqzPd4frqLfdxv1YC2U4RwSnHpmkFHkM2UCC1vGNJN2GIggLyVyCu
 7H538dgBqqtZnLVyJ5VWEgJKXz2XJZR0RWDAW9pRC5w+u3JHX0OWaWMEhiWuRTAGVwsRJ
 2Q42lVr6w72IFtekCaZ25LvLX8NUtRLeSgHmHr2wfEErc28plRYhyCjH3q8fflavz2HQx
 HUD5vk9dzvlRzEXjqXYxdXoGJHHFQwKlSHVNhSVo1eKr/rXJRLwB89btsXy5PKEbJkah2
 tO/VQgHfeU4Vha8APd0gVo7cwYUv03N+j/xWnXJEeSRNZMrMIYs+Ehi8KLCmcexE3Hw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EgxHdVtO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EgxHdVtO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3662403F6
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790977632;
 bh=9kb611CHIKP67ZpdYPVKfINDz9g4tpCnKlgCQmervD8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=EgxHdVtOsXiMc5cuK+y59sl6aY9frPv/GDLfSQ02pYiSEcptBLCQxcvmhIlUfH/b7
 /Zx3iaanfv7CCMRFV6uZpOQ+YNal7ednwYDtuGUgQlnJQHO1bL0Hb4BrFhYvkhGnyQ
 GIOAecyM8MC71QNQULjx5rn1fH8e/fsP8qK84IYofcs1EHWmhQdV44wWhd29/J1J63
 C5nZFRz+cMFaQLe5Kvl2SuEcWkiDISMHcExF4k/cfgdKxGt84rMXsPiQBrv5XnGekl
 Uv/q5IkAAJh/alkc7YZZld7nxzWhYF1yEe9EMu8xWbQILZvHdSOUovGwZArqqc+A1J
 KR7N3HWozjBPg==
X-KAS-Sym: v3:f51bdf72230551df:Z/zdfgl9C9WMvzVfruq5VjmKL8L4TeUZ0RGKAsE+OU1Tb
 LZBQYCc7/9Vi3CkNnxGiOvyog5uXJb0l5ln0VZ/FSmylP/iK8tX5UQKSnhNLB0/lT2jWX797wUZ
 nB5LL4sROxpEs9rhlKL1oQMbVZ6WdWlX1ZEfomzMiUGZQ3+2AFelC/5aG07B4Q6TbDHs5bwYTrv
 7GVBSq9NcVFklK8l/VmX2iI3f4IUSRq+Qxn1YANv2nvd2JloM12bF3rxrAqtZCUzKh4qgCBCQVd
 Z7Z43vq6CTtf/YYecIhqU+FI1VMpyOgeLoNk8OpL+8UoDL4RbGq9Iun/UdxvEAxAxVTUgxpQ==:
 gySmjDJP+xniNoh7LzKYFVaFf0m5dpGDCLHS2ef/As84uZFl10cjGLQ5F7eHTUMez+Xsw4M2saz
 B0phLXtjmt8meJ/F1lEbLkAlBsoI2gHQfJtg3c1cL7IX8dxSAu4GziBwrpoNSrT57l/YEmu2NXP
 5pjACu6Do+Kt4uHqM8gUCULOCIttBJzCLSRZ2f+bXDT5BC0gOvHaQad1oyi+5EMjvRjRcAsMe8x
 feutC0R5asiFGGyvCU0K5Yjhf0Vn/rZrm0zk8BPlrt+JOHzAcZvA45SfYt596gwVgwJZotq0ojQ
 N8pIj1CmkFJpJX2CwH1PNK0M42gg30m1qmUQ54HcHMiaPzZIkEIMHveeocZx6/aBVP9HPfKBCv6
 W3LQTeo32IYlBw4WGR2WnE4uyAgRMVCu8k7T4vGCzIqpIpOAVdlJD6SBXsIsqTjmfHxwoaYWv2v
 37UMLsbyn8q+G4lE1AnENdsIhrR9+8s2OWG9C+vQdMOr5tE0G0paGDIUva7tjDHs1RWn1sjtzIE
 c8OTktdv6Lp49KWq0hVFkM7SRIduqZ7rbZflGhSGO99tawB7IPFODKziPDBEd3p6r91dVVM+q/2
 ObHjouIJBHLpp9bSkEPk6w+jdHDwHab9dxsVTrnOKGIKEQ==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4B63BA4C5409
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 23:47:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43454)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCl5z-000000002d7-4Aj5
 for buildroot@buildroot.org; Fri, 02 Oct 2026 21:47:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 23:47:11 +0200
Message-ID: <20261002214711.1164231-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002214711.1164231-1-bernd@kuhls.net>
References: <20261002214711.1164231-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 2/2] package/libpng: security bump to version
 1.6.59
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

https://github.com/pnggroup/libpng/blob/v1.6.59/ANNOUNCE

Fixes CVE-2026-46675.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/1960fa5d39cb8d9fb6c2a51e6af0c664e23b84ab

 package/libpng/libpng.hash | 5 ++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index c387ffbf02..8c3647b8f9 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,4 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.58/
-sha1  6263409a6907d180e7b990827ca84ee944c6cc17  libpng-1.6.58.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.59/
+sha256  d80dd2a38a37f803cb9b6ac7b14bd6e74ddc3b654780a8380bdf93523fdb4389  libpng-1.6.59.tar.xz
 # Locally computed:
-sha256  28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775  libpng-1.6.58.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 1915941b82..eeedd81f8a 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.58
+LIBPNG_VERSION = 1.6.59
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

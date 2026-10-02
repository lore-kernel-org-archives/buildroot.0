Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97558CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5706681348;
	Fri,  2 Oct 2026 19:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEx6k7VcIv5a; Fri,  2 Oct 2026 19:35:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 824A28133E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969720;
	b=o9GinOe1NOybfAmHPyCQAptyPHnnO481WSKB5cqvIUwOrgsLit8G4MmKKzC5NH3URFN6
	 K53ZN0LVRSKHkV38IGIj2vX/wl/v9r9gzks3z/x9LfIHREzgJ/HkKgMDkoMSeEJHou43X
	 GXE8vgAZ0xNU8LeDBm/VxiZnop/+WAbiNG8zeH5cfYcb/i7EtVAwCnlWat9+eTHb1a3xZ
	 QZpyYh4KUD47Y3JFZ/puRxPDf/vD0aNr7N9AgPW4TWhneGEQySH3TiABTbjlVvHsepo0L
	 iQHepW4OTNscyme/wZQsRzwmzoT5StedR+G9Cbkvist8Y9kxBg+qO0XhZIIL3iuIlhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969720;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M+4nA5OhC7LJP75Z9WBef/ZANEe3rzoxpHXgk4XUf1A=;
	b=cy/9e5NyUCEOijKOCKnBu8as0Yk5iC27FPi1lrQo7cC5AiGekbebb52+pRJj8WCaJR+j
	 d9/A98kwRS08STDhtl2oMnkb0WUjGzDJKf684pgMbcS8ZC6ohlNEV5v6G6XJz0dZvZGuR
	 uueN8L9ioydebQ204YsUXYQ3ZEq/gs3sI9oomX6GOdzB/lXjZBcSryuEqrCBMablh6d+p
	 ukUd1doPDZ+O1pXUiTJwedSPEqprZqiwAD7woRAgkdGNnWyHsREAnDk1Omlwe/4i8aHo3
	 sh7CxSdYighmk+T5GYNPUoXTyV/ONhxpkdBHfaysptal7q8v5T3kVct0q9l7FtQ7WcQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969720;
	bh=M+4nA5OhC7LJP75Z9WBef/ZANEe3rzoxpHXgk4XUf1A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O6GB7KwqSOENjbXoF8phMfEEZBMV/WNG44r9kf4lD7+6HPNRtQmoIMhdCWQwNdlQe
	 jH2dijT/g7lQQXuv2kwEqAJicP2XYwkcmCYdOcv2lZQ/ss3vmbhzS0TPJuwtZFTVe8
	 I1YdToHZTuAgJ+wCiyKFgLo0z0UwoPZfH8jDoZTwsy/X+nA1wCRocMLIltgPOa719u
	 uposdZJUHd71lvq2sTaCCp8278wrJ9ZgoGtYG6tjUBc0+gAC4ih/kEIiLlSPhHKTNw
	 MzSHdFPIi2p1kU40xWgc7RY/ipkxgGuK0FFJHKrlNFDTHy/WOQBDyPp1HAQHjBNl84
	 tdZV8t7P1+fNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824A28133E;
	Fri,  2 Oct 2026 19:35:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E726B1D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E48DD40DCD
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PShLJhWhe94T for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:35:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 43EDC40B78
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969718;
 b=nxkAgqdTUjS8Wk2JpCtjZk1XCDNH6HLfUypabyvu3WvrH8C/eGw3CY2Yv530gmoJ2otL
 LFW/zGDdWXIxNrffMOU48Cv9648/0ouMR8SjDqZf4dP5X9pPjcry6/Y2OoAqEJmnQCR03
 J3NAiBGoFqath6c86kaxbhmsiVMvOH8Qp/s7OtuKGydJrGvTej5PJ6WVlBUwQS9i189cW
 0QYktuxlKNbGv73Kv9raICRMktpHbTOKBLmmHucLxnEFXUZHlwM4T2YdXtG3OeP0v98cL
 HnytahYSE4gkfRZnxTxdNBXtLPe8NeEhkr9wIPGG3Yd5WpU2O+aNfchsttDV0mxJM8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969718;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rxEEXJmzfjcLYMv52rvfMQfsdAUOw0NWdborEEUq62U=;
 b=ZS44/YZX7smTeXrkMRwF69Cn764cq2LTs+E7JAwq3yycISrcZ4j04PGSX6iNu7pZPE7A
 nvdl4HOAtY8Rp9WaF0JVG6PFIbq49pYT+XmLJ52ewy+w8P9Be5K4qyaavab4JHh3h/h46
 oUNr23aEtiNOddANuUBVpmWcD7qMh6OwDkbtEhPZWwTio8Etm2UxJbtWWNipdoVhPD6UZ
 YnqBtOGwDaet4kwEa/ryXICpkv+GLl9qhFrozlEl9C5jYErCNiPJ67szRsTd7lS+XXbOR
 ATyQziPs7rTGHgPAhWJR10aECYtTfcZwqoqPeZB7ef70mkjw7Y4/1yA9HM8W8ruLJ3Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43EDC40B78
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:35:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA479886BD; Fri,  2 Oct 2026 19:34:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:31:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6274cf27ec50503a59440d5161700ae402e3ba4
X-Git-Newrev: 3a5c80cd9ac03f050e818babe28a250793574327
X-Patchwork-Hint: ignore
Message-Id: <20261002193403.DA479886BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpcap: bump version to 1.11.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a5c80cd9ac03f050e818babe28a250793574327
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 1.11.0 (for details see [1])

[1] https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.11.0/CHANGES

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 87cc77338b..37d2a7553e 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.7.tar.gz.sig
-sha256  0b394ac90dbc0a9838ff97468e05c9c9a3e873dec2514cd58db65d859d296e31  libpcap-1.10.7.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.11.0.tar.gz.sig
+sha256  596389bc8560ea027dff9db8aaf6c173d992366d9aef4baf5d7c6d180b4d49ad  libpcap-1.11.0.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index a501ce2962..615ec9e251 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.7
+LIBPCAP_VERSION = 1.11.0
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

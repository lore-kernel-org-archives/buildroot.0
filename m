Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82BBC79F87
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EDB081184;
	Fri,  4 Sep 2026 16:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9reNQLzQVAq; Fri,  4 Sep 2026 16:22:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6500F811B4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538969;
	b=CK0lkA/19ajoAcCimWu7AWMWahZiDd1x2WidimZEtPRj0GZzrwwIAT5IY70dxLC+H+nA
	 /u+0SKVPhI+aDw7EDvcRxktozVZ7eqFm5A+IEqPabknz65mNx659f5Lvg/eGBa2RG+mrf
	 NUsNmCAp66FWe6Cquqda1+AH4/3STJAxPdePePQwZ7sJMLYsC2iSTfUl7/ZJTSjmP5T4e
	 HVrDksDU4ZjW5jkjoVWgt5iRwP5CIPyKLcqomRpr12yXpL+vB+FWOOIxi5TIhK21i56z8
	 nUbTkVkMz2QLOF0O5KWEGj4LckHsgKxOvlrsYgtO+fk0JsuYt/SpCIMItaeFeCDNo/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538969;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=G0/asDnli1kOwrgm8F5zgLUYXvqmTXZr5ZK//W6oHpQ=;
	b=h5/gHKbZTDhdhrMP7GscXV9y1M2vM4KcYrba7pDQUOl+KQnb1rUq1lf/BfacSYnw8iyZ
	 dgdEWyQXLpKWoG5V3ghGbgMtc8tLHkL+Nfcceqbhmk7CDEroH9xEmI+vMZ4CBQqgokiBx
	 DBkmAoSmRHLyXtY/rIas73QTAQ4M1xFf+R+mpPqFEsxThj0Icc8S9DJ/3jmORhvjPESjy
	 ux551wBxdnXFFjZiNgBTu7wm/m3AfCGFkas5i/hYQcDdJPDs8gKXNk4r8ps+BsLHxkAEZ
	 yCjXnYaEwHb+bx1rfw8tUuG05cQMNxW04gxqKujrfWXLsF8oMZvMlOX5/V8/nvaD03A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538969;
	bh=G0/asDnli1kOwrgm8F5zgLUYXvqmTXZr5ZK//W6oHpQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FHXmk9r8q+r67vZ36rix9lXR3ivadjqA7h9sp8d43FzMP4ca3ES+di2DGiHPq3Q/E
	 NRbxPB/2KxZ5+VkyS4Ip+At9411IJsb+53RC9gqEehEjKcyz3FlOTApkmCOvS685Op
	 Mndqj0h2Kk1gGuZeLefhWTMV8Y+OZZnCWtczNTUGAduD+HW7W6I0noIjL/9CcMdd7Q
	 LHp8mgwcJlTvgUTqYJjEfLJap6P0SCIhm0DxFQkV5IoMwjJcMyPWOd+H88yDxwztDR
	 I+YvWl0qFClG5QOxGjaV9MIMZrSKxn6q9j9CeV1JqvW+FBksuplZRItztbIH0y0bbO
	 6sJlEWCWku3Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6500F811B4;
	Fri,  4 Sep 2026 16:22:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43D343892
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3204B40A68
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RI40tcFqKgkd for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2468E40A9D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538928;
 b=Mzg6ptQdX0HxxqjnNRmxVTZfDWCF+kkhmlIDVwE4FDO/L1Eq7/TTKlg5tsvVZFaBDn4O
 XGy7MeAB3iZ9YOyStNyj4aKkuiK1InCGAc7CiyeLD4p0bGv7dIZ6uQfwqnbz28ShDq7HG
 pLD00O1OxTYNr85U4m3pxRYmhpPmuplmMsRNIBFOOOi3bmVb9VfGlAyu0gX2k1DlfRco6
 +PNWhZLIyd5jZFXM85Nu0OkRfWfj1Rjk9z+1Ab0hfdXBVKQ8fpKntKAKr0ECoav6tre0V
 6XiUjRoMHkRD778RTNko+br1yxnjzqGwvctWrzsAnmQCgUlK0vmNNYAZL6+8ZbvzYNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538928;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1z9dnQVgjCGCwmi81VsAmgopUkhxeU0RcpdSqcKUjsU=;
 b=CY7vAL/0WUyvLMnh63cwIaC/eYwTd65FIbTgFDOopzhwx9/8pssZcFZvzOzLqfoJf3FR
 EWWf1qekMpV4RNiKk5ehGOUW3c6L0XYYuUC0bMWEWCtLTdNDbN3gr1/4t3n2uZOz7GcAU
 r/WoSPntb5YqEquQwWlivanUtD+iHcBGu2WO4O42g7X6t7oCD0YE2S+V3AagtMpyaJw4j
 foVNbEq8RjI88igAfr3pPRsRqXHnvJC9D9/lun/cM2AIf70bSaC3nb8I+p5SRXrXCh5x2
 ybz2LrX+S8dRAj2xQ6BVePziFM56pE6qauLs1d/kRbpfAiO9Dqf7yHEEOZWWMhJkyPg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2468E40A9D
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96D8094C87; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 20:11:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c3c5f8728ba9782fe11867723e0ec25b89c72f6
X-Git-Newrev: f92220f16b3b0c24cadae6f92a662d2ac22a879d
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.96D8094C87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: remove
 xilinx_2026.1/linux.hash
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f92220f16b3b0c24cadae6f92a662d2ac22a879d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Now that all Xilinx boards have been bumped to Linux 6.18.40, remove the hash
for the xlnx_rebase_v6.18_LTS_2026.1 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash | 1 -
 board/xilinx/xilinx_v2026.1/patches/linux/linux.hash               | 7 -------
 2 files changed, 8 deletions(-)

diff --git a/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash b/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash b/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash
deleted file mode 100644
index 6bfa4d2408..0000000000
--- a/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated
-sha256  23c9cf18f5f419dfaafe5c3d3eda4812eb71bf1f2fbf3b35470478bbaa3d96bb  xlnx_rebase_v6.18_LTS_2026.1.tar.gz
-
-# Locally calculated
-sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
-sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

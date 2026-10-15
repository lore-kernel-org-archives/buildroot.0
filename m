Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD620CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E984090D;
	Thu, 15 Oct 2026 20:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbWzeuBBCqTK; Thu, 15 Oct 2026 20:01:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4ABBA408F4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094486;
	b=fE5ZESmniRfEOrQ19IBa2mcUNOrivPO60K+sQROIkW0SzDKZXJ3bxvuWxDHHq+NiwDTy
	 hXFcp6lIstVAQVRT366LZBkyrueEyZ1q5e71lS3ajBobl3MNJgudA6t9+uvSEp9m9MPxt
	 hcBpGT+TzwPkfXplEZC8kgOVHRkUEwH9JqOYlPw6YzVJyGL4NG+dINf07hrTR53PL8mck
	 EfgNhcdBqjHRFNk9OiJOHz/hNRuav/wunceQl65DIR6CXzOK3BlS81BXusJwMxn3b7rkr
	 c1m1lwfGGxxkG5EkrI1dF1bGPZOraOuG2kENq6nr7QIQ06ZWDiMk3Z3XLUEep22vXmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094486;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jTjT71YbwPDoZ+AXjXjH7/d67FicNVjyZ1IVO5wPr+I=;
	b=gHG7nc8mEprjrtWgMbM9fHpo8Ajg7q731Ae/a4aFBQfd6CJYgeBKKOPUM++cVUhTUGxK
	 f7usw/taX+l0YU4agP7B7Yn3LBJKeD7wYgoZWY73zdHXAp7UgMM+TCYJqxMe2eRLYrHs0
	 0ruzYyGm4oj4Owp+2KhdznncJmDPrOi5pV0SQOPBkC8Kx6LneKUnY3oU05wz0hsIQJbaZ
	 PkSSXJkz3nMOVPfH5UzZhjqFxALTT860cdcP5PtXcTU3ls+nlBFrfSlKhMh0ZqL8YriEP
	 vsUFO5Cod1LLiZnq+ZAoZ/gQ+a5HDQ+uBAZZgmRa8Cy4HQGUGgmIB6ue2qIsN5g9J4w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094486;
	bh=jTjT71YbwPDoZ+AXjXjH7/d67FicNVjyZ1IVO5wPr+I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HXG1jRai7i8GrNAUZ6thRXUs4ZICzYlsvLU4ckpthp1o/0O0+UK4bvvfrvzekKV/Q
	 UjhxBEDc7jUp1ZAm1jMoHIP7Pak+epamA84BKWNFig9RZM5rwUj6oe6hqKFt2EaoV/
	 wm8WQSHHI/3lAj5u5nnVRfDCezdqS3sGbU0+OHfKY7LdSTzrtVHGh4tN5VB2LQ3PPP
	 K1NqJQf0suU3mc4DosgltftWtGN9CfnZPcqCW48qpBzWu4nsDmd1pl8b64Ahq5A4Ol
	 vaGdb2WsOAwcYZpfsCVFifHXY/YBk4tKfKtNRl729LV8ZxFPfurBfAsWRnBbN7N33q
	 3yqL+xUm+C2BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ABBA408F4;
	Thu, 15 Oct 2026 20:01:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 019F4A58
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E691A811F8
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtnYWPkDNWqY for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:01:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3683181105
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792094483;
 b=hxDBNjzYRiw8/qo2g+FhHySOUaCYujTWZO5Q8fCEn639BVfz1hn5BdOrG8hBiEB6XfsW
 kO5ASWIO70AeDR885vvx3WXQ0lBNWETWwiJYhVe/qboYiZyUf/iUH77+zJTnSIhuSYbi+
 xIvqbqGswCauyhYFDMCMwYCiWx1eguYp0dDr5zVU8GD+BUrFcSzgbVpxLMVkL1/Kgw7Rg
 SHn0ZSo2ix+dt+AP6wn325ERX+PoaWhCGe8653fbKHvoBV50ETxYxR2ossTQZKBTgjsOf
 SSnoboFmdFEwlX60GyVbzHQHeCl2ik7ZQSvgj0Ku4fd7xaQCSj5clOG5TJopdn600gw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094483;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yC1i2fn6uXNQwXiCK8/Zg6cZj48GM1S3EfALtZv6lTM=;
 b=pi2nkC2qtwzb5m7G22SMDSEWfhrM5xVZrZxTsQ4uWc+xoPKRFtycofDv7dlKAxt33LL4
 wh59UGno8qfVVc1wEzQx4jGzII07/N1YX9+VNyoExzqTeagNtAsYOceyeP/csxp0cGMbe
 iJbVs8zONkyl+I3kuE2quEBz5ldhwyexgcQU6GiW5l5VCIOGd3sMUlZdKOGNlwwKr8tqH
 CQQDh/1qK5l/zVIzdi9b8LakNrJ7Sr0r6OZLp/STzSNgkdhqMKB20psQzPUizBkylP+P2
 12mc74gH1nzRQXpnpTr0cXF97JlY7Zb0PJsURWj2OPuP63LrlA9aMVbAi/KmO3ezOnQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3683181105
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 789D095CEF; Thu, 15 Oct 2026 20:00:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 22:00:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbb4710efc2590ecb96921e80128a4b8ed7eba29
X-Git-Newrev: 4a1aaaed803be622b4579edcf21f0d5e5a7ad7a6
X-Patchwork-Hint: ignore
Message-Id: <20261015200002.789D095CEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pudb: bump to version 2026.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a1aaaed803be622b4579edcf21f0d5e5a7ad7a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index f897f09735..bda4b2dafc 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  35a728fbb6996bbbc9a857e7142883d5  pudb-2025.1.5.tar.gz
-sha256  e6dedb81fc3c8cdcd66cf62e86337cb913570ebb2c994c9ab52012d059e086ad  pudb-2025.1.5.tar.gz
+md5  fac6cbb69ebcf2649cc1289309c12a9b  pudb-2026.1.tar.gz
+sha256  e32c8eeca47087699548197f101b1fe195ab8187b90e171f0a38cc0852fca73c  pudb-2026.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 603ce4cc30..fba98d46ee 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2025.1.5
+PYTHON_PUDB_VERSION = 2026.1
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/f5/69/0c52c6058da586e173e48ef8f9c45bc805d9df78d5ad4d69467ff68694b5
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/0e/ed/9fed39a03222995a65ce2e1ebc90b9dc27dc099bcd05613a61a0967e0877
 PYTHON_PUDB_SETUP_TYPE = hatch
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

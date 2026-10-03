Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969A8CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 538E781082;
	Sat,  3 Oct 2026 15:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8MnG7PbUeGs; Sat,  3 Oct 2026 15:54:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6DC3381305
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042865;
	b=kRVTqzDHruUOBlbBAQbIWDoY9HGpasaPbEDwaHuu5gCsNKbWiG5gSxjODUSc7TGxbHvd
	 ITwIcL2/QCzEAWaw1ClCqmVzVU6sdm7UNu6rxGeyc1X1grytWlLoRo7P0CI8O8c1MYSSD
	 6GvyLz0rcgUK1fblFOoBljM1JWK1dkgalvn3+/yv1FSq6Seq37XMJqLaMzIMciR2F497W
	 6Oo2ROvlgZtElXAQmPBnhj6BQRfcDWTiHoiA6khQYH0XOr0wfIVMfXWj9iDMzUbMmjmjS
	 zdZzRa8W53plbb5UNXSe9FmKQixqVhn9MYgJAOtMXeIjuW+tZBOwgtmp5M1a1ekupUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WgvWhr3yEKhOzrhmhzIhkVhXoMHl73krwWpqXBCFzL8=;
	b=j5AOEt0muDX+KKI4cY+nRJYuU1qxXZ1H5K88inTo2WvZGn2nA0hGdzZKgV3NCqzAeCXU
	 IUR2oEVhEwJokbdO2Lr0RTocfvoGrETWnTubx81J3V8+6WyiJ43aSMsvGS/GLN4eoeeua
	 UtQy3vxckaxzczrRWFgyIlWtKOmfERpNgJ7R+45SvvPvfqlVheuwbtYJAaeuliGvfijg7
	 B04esVQKM0iOkjkyklYqvM7ADq5nuYsnP9fs07bliCVbUlbOWUC1GLiVTyob2zAkyI3Am
	 7ZgIxWPFoDV7kiwMpCg4ZdrTDgpN5L4doVk6YbMuJ8Pfk+DGtIu8/hjWbSC6kFg/EuA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042865;
	bh=WgvWhr3yEKhOzrhmhzIhkVhXoMHl73krwWpqXBCFzL8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EljNJc1yfyWNkj1OpEs9bxueBCP8SREmc3NnHDtK4Cc1ESS9isF2KGqqtTGmPBlQq
	 H8YrOCoqyb3Qs+Oy766O2BLIIKf4NOAXeyR1FRB1CeuDrcDnLMIqo953yjbCWQK7rg
	 tOgc0Eh8Kij0+R9WryRB5VMV+b5bDQ9ZahucXiI3shiHJIZXJqStHNXBIUYpwZ5g99
	 xZV6BI3bMIkn2j3jOOQAbljbgAlF2/N4ZT7F7YAANg3Y0hRDNA8AC5NViHzkR1GKon
	 NZkiKPOffj3PqIiX9n5UJbLrJOv4fju2NbBSX6Ot8dylwXSD+xtRtwA3foelK+dchG
	 8AdCUBuBu7ibQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DC3381305;
	Sat,  3 Oct 2026 15:54:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA2AE1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D10C2400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inlfaMMxkuKX for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2778140024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=kTm/33+DXHqPL51/KRQJbv0uCK30lxAgRfnLhSNda14bG0ESRnf0wbsAcp6NuWT3Rs1z
 CtaUI7BZr3r92vYDbDQroDwWWElRsj0aGNVfNtTI9aE+luvxBgVWT83+Bm2BwAqKJHOUr
 G6OWtx0Ii1tgG/fbC6iKjFyq3lbBTSd0UPbf6mNaVMrRHQA1W6NCs1EAb5KYTmvrU/0JB
 pjt6yqb//HLtLhWgKqthxO3RBmbYV4KTmag3ugVULqMw6Stw28agPeUPH02B6/nh/r2tY
 KtipoGOOCgyhSg+/1S1sRsec+KdP/kJGfgTDlLO26gOtqfMVon7yUgUjAYlFEgN/3MA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GxidPpCJOzt2lKJzUXfybMR/1UVXvfUHEzqNsf2Q7pM=;
 b=nFYVxGNmD1Na9ZxCoCBqSZ67x4U2IYaztaU2JYQQJ4LrxttteFlv40vrAfCHLGWuS42F
 s8BaV0c0lih1D/0quYygnZhm+3PheeGzWOgdfneytcJ1hhULqiHg1hapg6zy3Wx1P5lpF
 fQkx59Gph14wXbo/YW4p7ohNr9JuUgANuuL353w5JaEmoe43Z7RPB0+KeD2x9iLMj16Xl
 GR34sgZRHARGIlmSnNWR5rwPccpUDzfTzbhsTBc4QxS9Eds3VEglJKvqSLHXQ7xgiwNwO
 1Vopn1TuFu8gGCr+CDvrC5dA2VVxuL9Ae7wozT8+sA1Xm3jRCUAYqOQkN0NGNdXedkQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2778140024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 695228A31E; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eba383f8865feb10cab10bb6b3ca4019ae19cc99
X-Git-Newrev: e6c8ed197c1c5d037f6dccd1ff583aac2dcb8938
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.695228A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydal: bump version to
 20260520.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e6c8ed197c1c5d037f6dccd1ff583aac2dcb8938
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 89589abd62..22d0114dec 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  681d6bc922b202ac950c769164034d0f  pydal-20260313.1.tar.gz
-sha256  2df8de415dda8821f0a291cd66459fb889b28458ee6501778f682e55530847e9  pydal-20260313.1.tar.gz
+md5  21ca33debbc8a022137143d4b04dbaa4  pydal-20260520.0.tar.gz
+sha256  a1a01d28655231b7e0893ca13e9c92084549f7761042e1ae9ef70d37146737c4  pydal-20260520.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 94cc264b44..45ccb2e888 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20260313.1
+PYTHON_PYDAL_VERSION = 20260520.0
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/68/51/c6ae7cfa615718812f974560b24001aff542ee6739232fd689e87ba75b1f
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/20/4e/1d576fcb6857f56cd0aeb413c387044fd609140628d1c401b7ae29ee6190
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

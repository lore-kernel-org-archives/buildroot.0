Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEF9CCF2E3
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 602C840737;
	Mon, 19 Oct 2026 08:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYjBf-Gta_Dc; Mon, 19 Oct 2026 08:37:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 72F9740723
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399060;
	b=V2br+rqN0JIdeUuU+p3CbN+euG2AwpMVta7dai7jwxYZN4n+ct2LnANzdI1WjHgmKpF/
	 YropfIYKfhMU++/yRwFMfrwc1jlT0c37R53NRXXx0VsZAzRckTUeWmh5zTlMJOtQrIPcp
	 wd2PbXI7lvVnyDaDxl2ILTH2qrc+/idO7eazoDUDJM8detiF4oAg0GfaqfoVewt2yA2pG
	 /Pt7NmfJOGyFyPxP5uh3EehnA5fuOluS1mOmpf8utt3i/7peL90qVumSzswDdpjMs6AOZ
	 pQsznRjqhGjBy6tPgeSD4USnu7+DtKKBhV4WewH8HR2Yt4sdKz+Zn4ZqYtTLLWK0UQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399060;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xMaK5elZ5EjEnFwovIgrNS86GaVWeXkc5fyME9VZ2jM=;
	b=BDda5NLmvmTIaJP/IWG1RlE7yfX5/PRhLUna4qa4k1RbfHcZlFZqm+h4ph9no1pwqcBU
	 N86r757zQvMwaXHxmwz0qOelHL8FXnGPPQIdiZK1JfeMi5HfcjhNaPkwmIF/cv6hRZQSo
	 yqp+yefNR/XS+dU29J0LPwz6JfDYyBo+W7/n3SpopTIYXfW2bYlWqhtvzsMK19QeRUF4e
	 0QnlacnOoRX2FRWR659xWRxJYTXuYMioUcbcyKNcVdFLF+kINTahxDrRACNMybiQwa1fH
	 ylq+WFQq+NUlfae8dp8L11GnYPR8XS188B3KHxTZJCgps4z+fn54WNLtJW6qbucRACw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399060;
	bh=xMaK5elZ5EjEnFwovIgrNS86GaVWeXkc5fyME9VZ2jM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cQVkENKRJ4G2AlRNkhQ84eIYI1f7vCPEkfNhQurShIrVLyvdi3w4JJ2yGWRKKdJFM
	 g08U3ZZGoGQL2d2ldWOv/Rf9degdzIogfYyf4Mf49dDr0cbHTnRRm08Om1+LmQYHOf
	 Tf0Do5pwNgHaV2vIhTZjTi0MtuPWFY71dBwd5et0phsBz691KG7+B0yrCJ1dNf4KZV
	 5zqpJgKCcCVqcos25wifdypvwReX/J4DbfPeqPU01STrIMSD35zsiokl3rXKabrWBF
	 XbmKQxmv0pXZkdDZrYhGgNHVA9PyntdkpfQ6TjklzA+M8PgwtmiLl/eu1F6iSU/pn8
	 xhpfsIsRqOtrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F9740723;
	Mon, 19 Oct 2026 08:37:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3D95D7E
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA0B760735
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbA-sIrZunen for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E664560722
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399051;
 b=itXeS+I0XEzbG2YalYKcuE79s90Ay4ty+K/9kgtQlUeRk4jOJCIz3y+sYQn9j8mkaeZ7
 cRGbACgTN0/1FMxiJDgFj0R05ptr9VL0XfSgbC7uoks+8Ul8vo48+c39kChy4mZooQBGA
 6k2hHMLcKbmRTza4jDpNCMGgKAZ0qUkJNXWrEHD0zDTljzoTWpAuMVHo+V9EafiQ8xp42
 xY6Hl4/iuTDWK5QaN1nougfFhBwH4+GF3ImxKlFW0d7sqGfO+qC2Iyk9kJtr9v40/c0AV
 pb6GTwJjlpABN50+HjD+A6kIXoku869S4ZL0jm/2w1KFHWfLvPJ79THfwBQAKBRmMog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399051;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rLeycmBNKlnpe5OeyxnpUO1eIIkZOLxvThYuODNVa70=;
 b=XjiiFFjghX2+5KCF7+eIpdT1bJIDTvw+bbQsvautnYPpR25qlDHnhd5C3clHiiwvFh3T
 MvWd70cw54K/fBMFBGoY2DVsbE0xf2y3L2LllqbehuzXIv3AL0I0ZBNBgHvp30dnpzpS8
 SO++ImXCZoNu10jG2NTKZXJ7fJZegw8gy6gRpnpzPhwDfOBsAFokFBb4hY6/A+tWr0A8Q
 e8VvsCzX2XZMYDboNMzAA4ruP+MGwVhgrnsjfRl+MiN9q1ZxMtoOa5a2JGOZWNXotJ4LR
 ins1QaS/5mKI4wA4TR1S98gXMqk3+DhzDsb7zU6UIPp7sJ05LnYy90IGPnbtrLRn3dQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E664560722
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BD84984AB; Mon, 19 Oct 2026 08:36:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:29:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbf4c4f0c4ed103866d00339093aa8abf08f77ff
X-Git-Newrev: a6c5f4bf2e9794733ade18262712396000f9ae1c
X-Patchwork-Hint: ignore
Message-Id: <20261019083609.7BD84984AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump to version
 2.1.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6c5f4bf2e9794733ade18262712396000f9ae1c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index aec7295d88..49c20184ea 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  9f267c2c350584b2b9a52d17611a4d25  sqlalchemy-2.1.4.tar.gz
-sha256  7bd7ad604487daa7eab8716471c29a7185f17b5287ce73bb7bc79fea050d8cfd  sqlalchemy-2.1.4.tar.gz
+md5  f1e2f4edfa4fdca60ca9eba308cdf610  sqlalchemy-2.1.5.tar.gz
+sha256  0df76cf1ca680ad745bd378a6299a058611a8a784eeaeb4ed78ad4a0b7ce2003  sqlalchemy-2.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 2920680517..fd152963e9 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.1.4
+PYTHON_SQLALCHEMY_VERSION = 2.1.5
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/1f/44/311bac6b6ef81e4dfd0287d04900108b1f5c00c9761dd3c0a2b7b9d0f86b
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/08/bb/28e3106ee586e5b2f5ecf211eec1348055f0f926314b13fe23b9cffa9039
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

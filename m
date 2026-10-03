Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6593CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89208606C4;
	Sat,  3 Oct 2026 15:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOpdwecR7NYT; Sat,  3 Oct 2026 15:54:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9634760684
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042890;
	b=EroW3HIRdoxsGnsUSzUpYgBPbMfmk8Qx2rLrEm+WYaUfbGRoNPJ1AvPITA6bSRy0lDtM
	 MrJ+OGQtcQch5gTJp1a7imIpeE1OYbrbEbkdzW5I27PwWfYTCZUyqtP+FmLbPSpCOpG0T
	 KEuSnmz2vTpxjFT6R6MkIe8A/vRrfTWWFGiSd1yUrir6asAs/ZrAkY+vxQygS7mhcp4xa
	 SA+QnTKg8XfZpQe7PyL7G52EbOUdfB0/nMcc3i2ZNRwaaWFlsX3c5ZX7Pl5dvV5uDKDuU
	 avwHDdN4y+xGrRb64MMO04Lb/JPRTcF9Doh2aESv9OL1n/HXmuJ/D01qWuDq1LffUOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042890;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FJtwTfWKS1UmLc8SiHqaZQtK1O2xExaqTQABwJSSLEk=;
	b=l44ZMj2jLSXi1Pclo2KtCiPm5v1qWmM34tIQL2VyG1LIeQea7IWd/bFOtgeE3vsROYl3
	 wYB6L0/Rs0Sl4Gq5p0i5OEl4SvIjaVkCxA4tFxHCRv6bZFtZgFyLQYIbJwrqp7FIxxllb
	 pfgXMgUeRqTN8Ty0Cc8O3XjR9sWHmUQJR8l16kyJR0GQwCymFsiV1HUlXpZt7j/9j5kuX
	 iTM1OPG+f29Wg29hIULEp5RaSxnfEHc/8HIh8pfF9z4uhdeGmUtpnc0mHWu3Y5R/s0ifc
	 6rYy5OJaBeVJgwYHuiWAWOcBPYZTLgncdY9Svff6pW+QvVVRzinUu03qEc9udD7n4ig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042890;
	bh=FJtwTfWKS1UmLc8SiHqaZQtK1O2xExaqTQABwJSSLEk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dFWRwSIpRDfLqusJWF2Yxl+O9J+76tgoXJf3QDT4kTvtYeX+0APPvrNVVWWJc0dTo
	 udUqziyJrSLPlmcEXTU8nnJntyNGmQ+WCHL5IjSv+BlXFg9Qg9DDTYLsjgX7BFIW//
	 W2EmyTwQdsduLrm63tZU7dtAKX/CfYnEFLeUoDYQkkthRFzfn4O6dv6TkB1RhMatQo
	 JrFrX6CnXzx/aLp8qzu141ieM0KdtQOzewBsSYGBtbq0+ftiMfVe41K0KfwbyZvBrM
	 OpMlshgGGW9u2Q3ITT4jhkOGss+pC+mqDJxx5TX8Gp4z3o29khjpm5urC9ppCvvLYk
	 UrExcytdmt6Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9634760684;
	Sat,  3 Oct 2026 15:54:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27B604B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 173E6400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCgM6Eoyg1NU for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5C981400AD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=j5WiW/v69HZZJ6R9F+U5jjZYr8j/MlT7cgjWfnACbLVQwqyu+9LSzgl8NkiQ7TKwBsWA
 bjWlLwOElHRhDX5GdXlD4xzQtUcubN3WBk8EIRbaeUn3tot6F37n08wD/1CP2SlqcWKsz
 oJlZZs2NrSMbOsRZk9cESx5AsDbCl3M+a5i7m0b9anDZjPVQH9TeauwhvQsq+oqIrSuqt
 JXxExA6b6Hlj328vB4DE2bh2NSFNS6GRITZgfk4YfePEord+wrXTgjI7JZ5+uc/KN5v3k
 uC9frlWio28lvK8cM8hBey+WI2OD34RHZPr1JVxcnZas4IblnOydV+QUj2eLBH/k8Dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=87Vz/nMGwX5O2m59Mkm8JIJnMuXw7TPVl+l12MceWS0=;
 b=HlCF3XNRkiZOhylxLKY9bImAlDoxgYZR+Yd31AzVs98snzs5A+TO0CwDwwaWIliwtQB1
 sTSZ9o0KeiwAHsaRQ180vQftUSInskEhrJG4Na3BMzN+ULS0EFBffpgyJdmUMN2eisBOI
 5Oaiu29ecpYMB9ef76MUHBmk1O2aQ/djwj2wODw2u/+YV+fDB1lhFOyDZLV44bW7+qD2N
 uOI4TRDZC87Oz18X5E2Vm1eDPlMJNte/pglCEJ4tjt4B4p4pksYnDKZde9rd8v07+HA6x
 Bydh590/+CXviNxR9Ee1Kreun3cM1mcaxiALTdP67KH0xnmSJlkf1Kp9+ahoeEHqHtg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C981400AD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D6EB8A31E; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eff3016b684a5e651efdfc6a1b82e678ce54b3a9
X-Git-Newrev: 17d760c667a205e31992910f9c8ab68b5a79eeb4
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.9D6EB8A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlparse: bump version to
 0.6.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17d760c667a205e31992910f9c8ab68b5a79eeb4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index b541aec42f..b0bb518e72 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  2023800dc264c2fedab3250a8eb43995  sqlparse-0.5.5.tar.gz
-sha256  e20d4a9b0b8585fdf63b10d30066c7c94c5d7a7ec47c889a2d83a3caa93ff28e  sqlparse-0.5.5.tar.gz
+md5  900c83341958cb0a16380b204f2fd748  sqlparse-0.6.0.tar.gz
+sha256  113c35c75365ab9cc9c7231d68c6428fb11c085fc8e9eb1ad659b7ddbf6cd2b9  sqlparse-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index af1af475d8..6dc7b59a96 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.5.5
+PYTHON_SQLPARSE_VERSION = 0.6.0
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/90/76/437d71068094df0726366574cf3432a4ed754217b436eb7429415cf2d480
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/5f/d3/3f06a1006f2261d1342aefb3c71eed02f5d4ca5bdbecd86ebc12ad38306e
 PYTHON_SQLPARSE_SETUP_TYPE = hatch
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

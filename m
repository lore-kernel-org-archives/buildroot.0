Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FE0CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE5F760816;
	Tue, 13 Oct 2026 20:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyYQQiqSmDjJ; Tue, 13 Oct 2026 20:52:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 07AB86083C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924773;
	b=SPnx3kJu9J32/dY2DojtlZ7ASngkNb1otqQdkPi81MzvG5ZRKzCcNrJmTr/UdNNvxNhM
	 fgZHWn6jIMtwzgXKZMVOvPFN+rk00/P/wUxtI+lvAz9o4fxzbEJnQj4Kbx23z3V6JUxLf
	 a9CB9gtM3ozUHkm6419+zSsoBIkEkXC77cvdIpgJduECriggryK8iDL20cjBKAsD4Fked
	 QJ6dbIZfSL58FkSG6EXOojJZR2Iy2t3qynSfcGd5q+jlr94aZv+UUrqP8DOxakBztU5+z
	 V+UPtCkWOKnAn8PStqKQms0/ryQXhqzR6NA+tgKgkfPfTsdklJjZAj9KBjYl263A7cg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924773;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CViqPiVKV7O4soJbXkx8TOd2KgL4WK1agIo51PDxoxk=;
	b=TFRuRUyJBmht7TuEW9QEcZzIhSPyB3ZKfagHDFCnlhPC6NM8TxBXD43BgEPkhyqJjOtu
	 k44+o0krssA1n6ksYtNkI/ubsRGz+PTaWqU4DoYcj3QcyEx53NBYA8O1zIXgdk5Q3+/Wg
	 DtNDrU7SJzy2qjkqmJOFJ/88SkAZyUm2sRCG132bU2DPtfk6Y7U/cZBhClqPMkepgs76R
	 vgFySSBITWBrl6HKfZI4/UW7tL8EuWANQf0crNMZIGnosO/bYZAXU4OJmlKbe0Lj45qKN
	 8ktZUVn27s4lQz4MGdcQRl0deNfZoZK/UtHrTgSGg1iuN4/HAqxptobHCfQL9HR4j4w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924773;
	bh=CViqPiVKV7O4soJbXkx8TOd2KgL4WK1agIo51PDxoxk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UObgeQ2cYXLXB9HrH2RrNVR+tSUkFwurcKULWip6yEeJMWJa4gZOX7wm8yPQ/f71/
	 QY8G/KN3OH1sHSomKdW6UA2Xt5jiPixa4Zym+28E8XrK4MJX/wpL4ArdZRAyvijNL1
	 UY79psL89I3WW3uJ+UOx+ju/4N7pZZfpT/giG6FsvHDSZ6cYjpHJPLbyDagz55l3G1
	 UCKhzVatOphKdMJSMhiGF+WAQDJcJTs+8GsAj/E1tmwgULWn1nJDFvXUnG11WOqcIb
	 +ZVJ+ydzJgqcWC7wbFrg87wNeJYE9RRa89Xkj7vT7AkG9Z9/sBvbkbj6nmshkCh+lg
	 6bAlC3wObTbGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07AB86083C;
	Tue, 13 Oct 2026 20:52:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08B3F13A0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEE7C40661
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5liXc-fwn_L for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 412D8405B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=MNmjh48lahIziuiGsls/9IYn3KxEcHGVGoJ1w3fKzs61645xwoHChwGk9j2ybgcNhUbW
 JK8EjIRwb4/tTnyMKOk0ksgEtrZ20MlJNEoMG+b1arCkVccvz2aQCTpHpsVl3lvDF5UBG
 b6FUcWEwmfrcuzFEm5X87ESD5zTPsv19OzM4Rr+FTruCCkvjnxYgIop9bqh3Tc5jrJF4O
 I3m/mh5KJ2fNx6Tvo6QEpBQjBquZG7F4hmh+0/wubUdqWOk4NPDeD1XY97GBjdb6eNpPP
 GEZ7Rf1nB3GkGRejh5CR8kuJW42bA8xaov+SY1/TBvCJSLSM2N0RNtzmGRe32EqqwfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wqH3BOmTF9pRawkdFob7Z2o+JY2jliwTxLTHtw7gv4g=;
 b=lcDfO/iVEyg1v46Zi9bxQV6s0dlPC7c1Sqh6DQBvb6ZSBvF88HZpOnDLwQg6pbVjP+KX
 4VgxkCOYQliAvphKggLaY8bKHHG3qblcgnMhEWn3pGbhaVB5DCZl2DEQEg3Evi7ZpHTra
 Qtfte0b9kCtQ5vBum5NvRuPcKi6Dn6pNITwECMvgHAaZYtSQYaEWWePPUq5VUYuUrtnyw
 TD6f2euAXOTdpKGKYnFG5rKA4WfKOkYJ11Et9jov8ZYq2vG6KRBZeLS1+jEu9uhJz5gU8
 rq24lKOVnTY4UTCvF6mC8TXb9XPrFfixaG60xKggXHgwmA1PsToEvJ/qnUQM2MeOAjw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 412D8405B4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B2DD956E5; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf8d3648ee35d2c7620464ad616478c8bf357ae8
X-Git-Newrev: c642f13b1d5e3a7816cb83ab6a518fbe0728f173
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.7B2DD956E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pbr: bump to version 7.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c642f13b1d5e3a7816cb83ab6a518fbe0728f173
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pbr/python-pbr.hash | 4 ++--
 package/python-pbr/python-pbr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
index 797e4ce94f..49215c5a01 100644
--- a/package/python-pbr/python-pbr.hash
+++ b/package/python-pbr/python-pbr.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pbr/json
-md5  5e6b4341677c4d330637add000f59fdc  pbr-7.0.3.tar.gz
-sha256  b46004ec30a5324672683ec848aed9e8fc500b0d261d40a3229c2d2bbfcedc29  pbr-7.0.3.tar.gz
+md5  94f988adca86448b3a5a57d5909631a3  pbr-7.1.3.tar.gz
+sha256  9a4a85b84e906337708009af0b5f5cdabeeb72d4dc213c9e97974da54fd9acc5  pbr-7.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
 sha256  eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
index 9b3d34c4e8..d0055a12e4 100644
--- a/package/python-pbr/python-pbr.mk
+++ b/package/python-pbr/python-pbr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PBR_VERSION = 7.0.3
+PYTHON_PBR_VERSION = 7.1.3
 PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
-PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/5e/ab/1de9a4f730edde1bdbbc2b8d19f8fa326f036b4f18b2f72cfbea7dc53c26
+PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/6b/8d/ce438c28c7958e33184e8ac851ea2225b47a41e5e9e708fa3bddba631135
 PYTHON_PBR_SETUP_TYPE = setuptools
 PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
 PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DBBCC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D91E380A56;
	Tue, 13 Oct 2026 20:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPg-NoAkTw-v; Tue, 13 Oct 2026 20:53:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DFD5380C3B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924795;
	b=tePWXQnySzETk1kQvXRxZzNbUrk3Z4LiAuc9500TBUJDU4/LcyH8pvuoK0e806ta4mZM
	 2fWT7M2hzxrEGQc6tRlxY7jlnaKeYjftCplPJJjWQtr8S+z55+NFTXTiE1jXCcARRUx2Z
	 BKk80wEwmwlewxe65Jl+pOZLrhiL/htrKfAzQ5fdZCQdIUIiUR9U/1nCcHI7sG9Ohrf58
	 LfIFmqgC2P2dew1QyvlPt+48ZRAyOhc9GA6ENVNYYCiGDKPYJ84TW/KGAFbjowXaPrQuh
	 i0HgCOBfsxeqjCMNTpam989GnVAAfFKiPwHaDIzIX5bHiYZNPl65NCpgxyGwPu2rDcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924795;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=125JvfHa9WmjbWzK1vDelZax0W+1dibKlqb3NH6vZCw=;
	b=J1oXRjrNteGMS/rKxerx0xo1QHc6G6Agj4rCbOePjoiQrkQfNJVqIH2/WXFaj49ByYgL
	 5UP5BFrxbnYF+kpeAB2km+du9JYdJ2fDdVTVAwrBqfpPqrZhklic+DniIkWs5HNoeo4Kw
	 LOcVwBYu3DyYjNDaffXxbkkdHLWON4QynPaHmpqUthUagMfQ/wAxxvGvBcrDBdWdF5LR1
	 bcjiDbT9B+xVhsMJZ/ngNxS1dW2RwLys9eVLqk4PsLFZDVY0yBA+st3tSyKPwX0SGhwqR
	 RIWrx+7Vad2Tfh6hT2jqUkN5ZpnqxmOv5fOMDmv3Jc2W/MYsdQJHqxlB0zkYA+2lfFQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924795;
	bh=125JvfHa9WmjbWzK1vDelZax0W+1dibKlqb3NH6vZCw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n5lQBaCRBIqsideNf80l5uPBrV2kqj+4g7hroQEU83h3Ad0W9GH4WhWmuUYIhRTnS
	 Ei0Hi9V67kb2VB5DY4sQ+G3JO8ppyJRy+/knm/5ClH3O9NR91PF2+GOoiAId7N4VjE
	 S9o+pBhQy1V86V3lO4X67DLD8hVX/67nonQvDAzmiixvPH/Bs9yzmXkGQM0VuzJ4d0
	 zL+wfbW7EqXY5X63IYB587/kCXFP+TPMl2MEnyF0Dv+TgcB6GxocSSsGXM+sXFNzPO
	 SipJFrsiOSJA6KZ9iobivjaw9NNHEvL9EMXbv727iyqS1yUP7xV65hqotE5ZiLdoMJ
	 JSf4cUm7c7qtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFD5380C3B;
	Tue, 13 Oct 2026 20:53:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E26422AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C751D40619
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_JATQ4A7KqR for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0E76C405B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924747;
 b=hLYv2TvZaCnXj4OQcl0ouVaERaTZCszTtQFWAScxScErEq6LBgE5ClJdu41MIklqVrNE
 nsUL3FdDJzXTRJVrlUb5TBTfI4uO6yI9JMPkutYzjogYsDCGcisxFrpWKJio+4VLKubYK
 C/ikDKsfdKPzA1zrySdkLq3lTgMfWVf9onfrMvTPCS4oCjnm6bkq4+wH6yZy5gR4nBnx5
 AjIvCZtjHVMR5q9aF88/Gf6uS9pybFFkki8mX7JM8S97jZ2uE4txZ74UbZh5MXKjYOV5f
 V03jfnlHSYCeg53tt0wBirRoXb94RwZYOcHQ0KIuCoqc5l3teUaE+8Aa1WWFI3x3e9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CO3PJ5xEDpfkWgPV8Tm60tjdZt8ItjJoSt1KnZzVklM=;
 b=YK6JdgTMnm2NDMs/wW0zv9Mk2qeX5bfhzMEknXXxFj7ImG1c54qp3xODzs2mgkpHPA4s
 eqCH7wFNfv/Qh+2Y0R0W9QDmuvwBqPLVV8m6YudQgSMPSdxZroRHrHAYGP5lU7ocoPG1Z
 jIlRI4d9FEneHFPLl1tYKEmFY8P9Clriima4BKOYm//VBEsmQIGaVZ9QYB0czC3ZuRx2T
 1UCDfhjjlRjF0WzAQS5YxmRxA/lO//ocu4b5pQcAee1IQFObgoFcsxhWEhn6U0bdleHG0
 //bHhBWMuvC6iRCpqFQFf4WJp4rl93GIga2CgFE9Z0bW7G09iYDL/7d3Lls4IRj3cMQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E76C405B4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4889C956D0; Tue, 13 Oct 2026 20:51:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:46:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2505e109f0e06406b8ff4c50989ff3938a2e5d1f
X-Git-Newrev: 52da0bb32dcd9c184a2ede84c93da8d7fb4711ec
X-Patchwork-Hint: ignore
Message-Id: <20261013205107.4889C956D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-validators: bump to version
 0.36.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52da0bb32dcd9c184a2ede84c93da8d7fb4711ec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the license hash for the copyright year change:
https://github.com/python-validators/validators/commit/d3f0048e2831fba85e642cdc30c205639db872af

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-validators/python-validators.hash | 6 +++---
 package/python-validators/python-validators.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index 94825df32f..ba6d405e84 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5  8376f37ec2028053cee8f4789dadd947  validators-0.35.0.tar.gz
-sha256  992d6c48a4e77c81f1b4daba10d16c3a9bb0dbb79b3a19ea847ff0928e70497a  validators-0.35.0.tar.gz
+md5  9759d46d9816b23612196f0972818bbb  validators-0.36.0.tar.gz
+sha256  92ad9ed00bbed320b784cec0ea90b213cf08904cf605b3d0852cfa4108e32a2c  validators-0.36.0.tar.gz
 # Locally computed sha256 checksums
-sha256  43f5c5d4ed194818baae8b6e2d2d09e9630752392efaa4b3f8da673d9a1a844a  LICENSE.txt
+sha256  9567be0573324442d69eaf0b3e1e91c3f05fb4736b3202ab83eadbb4aff2f0b5  LICENSE.txt
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 3135b288ee..f9b208990e 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.35.0
+PYTHON_VALIDATORS_VERSION = 0.36.0
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/53/66/a435d9ae49850b2f071f7ebd8119dd4e84872b01630d6736761e6e7fd847
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/7b/3f/4fe7905f73ba0e768baa102a09ba9458f2f0bb4a676102e1fd7a3cb55c2b
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = MIT
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

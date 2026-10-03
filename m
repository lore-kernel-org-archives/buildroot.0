Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E862ACA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9352C60EBB;
	Sat,  3 Oct 2026 15:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yT6R12lMR_Hy; Sat,  3 Oct 2026 15:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 929E26102E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043013;
	b=kzeMl5BswGTSN7e9JCuZzkkDTF/A6PAWIuADOjqgbesqR2YX8iwMVTfbBTOcTuv19Vfp
	 msjKXkXVyEkYAO5BVE0LfFYfukmkT/bZNgnh2oGaSw5rpvoRkv4eNcuhoA2L86I8o8phY
	 elSLs9qZHpwoFN6KOR0P6yagUI9giJ0siaDMohEiEjQtzt4SoO0h3IgdNydkxSRBxQeGj
	 wzoGy9suQlVOVcJyydqHuxOdfWLD/DcqDqHBlxO0FY5mSd5jMo+2c+YAnBMr3jkIidbqL
	 /ST2O1Vi9Ed3EJTNkf4QFGYlqucQne48iys8wqaOOOaZVYeCoAaBVFeymP/mc24vEuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043013;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tKer9il6qKMFUaUrPaWYwE1+m+w/hDkn4TfHSLVxMc0=;
	b=V+WSCehGJRPaF8INceI6L5eH0A4Tvafqy0Rz0Qu9e4yiXoLFxRFjvVNC+lst6ghirvSz
	 NlH05fh4NnrM1Z48TGPYyuQ99CnLg6euFX6Obl5bDKIXtc30ljbQ7QctSAsyyjXcpeiWG
	 w3YI4tpMJH0/W2xQ6CvTBrA4zRoof3zs3f9l3+dox4yaugkQh3zxTSyOBr8JxRPERnQmV
	 hQMsdmoBlqed+Vi/2C8ryEPKGXEZIA74Ri1cQ0lt/8rtJJrtGB1A4GgvMzzCa9jhh8fyN
	 VZgJonzUtsXzUoELUGH51QbIixNBm1rwotIlkk37+62VZkgbIlEmJ6pxuLR3b0aUl3g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043013;
	bh=tKer9il6qKMFUaUrPaWYwE1+m+w/hDkn4TfHSLVxMc0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MNXrxNMPuORKJhzuUYoqwvK3CpNeQPoD/zNvqHkXBgKE59FcJWzvsjowH5xN50fEs
	 FX8SoveiZXIa6ygJ6bL3MuSdpfibCthRNw+Pae6Wp57tbouVHExRkHSpq9Kv4jUhph
	 LwwAphKEk1woCQvJwH0rJR/v2qq1LC/f/fEFfTFDGutaGiJzszWSTYJSjGKp9/i2lb
	 spOmxUnfQf8owVxviXZxVuvU+19O0UctXybkUgpOyQFXy2oqE32szP+pxSYX7fFr5r
	 lSK32lyD/q1WJNKb3p10/zEs1XqUkaajaRNgRFMSFLI3yWAeOh4UKd0pVQX7wwsRY3
	 uqV9fIBk2hi3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 929E26102E;
	Sat,  3 Oct 2026 15:56:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 024FD335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD4356067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwN19wbfoUgZ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7B927606DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=T0NBR30RAzE9BNFlqTVOZyBdL06hgWwC7Ffya6PrYx2VMVeInXZvcdU7DLcES5JyM0ag
 FHk6bWhpI5WIRqOf4hfC1bO1hgg4Z0zd8lBYV8XifAs0ze+AZMnAwfEKAUiCCt1cOT6gr
 /IIKOfMjiNz7rmXaqF/aBSvGtSTA+vQPg+9gHP0x09opnVFt/n0ZThE8QEt1TRqt13uHS
 mWTBDBiLLZ3+68yh7qblS1jR+kM8dujjAE3Fl5yWa08h+RZtWeRJgprXYSbbG8QXQ4/LV
 v83wJV3pgyraMG8Pmllr9q0M1QACK7wmMTMdmoEMav1fpEYgdIE4SSvf5Wg1zM2H6WA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NfenqBo48ReDJEOAtwSfwUwvLfny23MBs3WCJ8pzdjQ=;
 b=T1ZtI+R3iIl7LHT/waaVTGvV8+97+7xMWKzUBVdVAwzJBF5qTZZ/QCRU/4p/iiRdGcmy
 GQPuuLtwe2Fu/wsDIcdRYiy3omR54CnnwW5ytftucZzgLOKTkjmXGTjbAACOLsrrE0GjV
 +tLfV90+q/RMr39c+gb22JzOHomQOY2VyaEjrETjMb/h+eidTMampDJUrTwWVYzmgV/c4
 iABVBDr9bAO8n+Gt1UIGYArp3TJuqmuBuemE3Mzn5IXh6yAn6kXh8ilH+4ui+C9J/Fqxu
 rc4QoMXd8IoGO9dqR39y8eEwAPHYNuZhdOMr+Jiv/V+e6NnJ7hMFtwn7sX6gFN8dsQA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B927606DB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBADE886DD; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6064d8bc0157c8a8b9ff2fc8eb4951708baf5e2
X-Git-Newrev: 7e70754b9938fbcec0e6effa4d1cd8c229e43474
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.BBADE886DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mistune: bump version to
 3.3.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e70754b9938fbcec0e6effa4d1cd8c229e43474
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mistune/python-mistune.hash | 4 ++--
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index b5478a6d57..1dc3277c31 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mistune/json
-md5  26272a8d5ee997f80b32a93e51a24b54  mistune-3.2.0.tar.gz
-sha256  708487c8a8cdd99c9d90eb3ed4c3ed961246ff78ac82f03418f5183ab70e398a  mistune-3.2.0.tar.gz
+md5  d04c3e2670b837ddc418f3a70d4357d3  mistune-3.3.4.tar.gz
+sha256  58b5c96d6fcb61190dfe5fae498d2b2065f99cf61e9649418fd54cf1ada86dfe  mistune-3.3.4.tar.gz
 # Locally computed sha256 checksums
 sha256  539013fd8e19f744f8bf0e27a532bbff54cd689ecef7a800f56ae5dc824be870  LICENSE
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index b67700b1a7..30868d8e47 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 3.2.0
+PYTHON_MISTUNE_VERSION = 3.3.4
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/9d/55/d01f0c4b45ade6536c51170b9043db8b2ec6ddf4a35c7ea3f5f559ac935b
+PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/7b/92/328a294a6de83bacb95bed01f04e0eaff4e3616ee359fc821a5dfc539b02
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

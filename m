Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC84CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33A1D80DB4;
	Sun,  4 Oct 2026 16:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwcjmBiIaeGM; Sun,  4 Oct 2026 16:08:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 00A9380DCA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130085;
	b=AE3zW6F6vYMRFKhce/wd2AIJ4waAR5oB7myWkwsrHD3wGO4WLcjd8rBurY/NwakXP0/f
	 gXqfYLhdjO9E9xJx9R00bhuQy3oVv+FzEKzHg1QeHWLzwN5/XO73VxbhhutIuyslmW83F
	 zdF7AzUcjdCUMiED383As3n6BP+1Y/cL7Uwhrr+pueNEIFDLDf17c/urlCqVHzQYbLO7v
	 CoEinSeitjT/TRZlrr8JjJkxaOcnJMsfpcNv22DW8xZkVhm6dGz8jSlpg3CXv9ryBv+U7
	 MTTStZJkXprbQZ7y2ngzusz/Q+tzm4Ii161L0pDJkVfAKttjP/MuDT5NbD7inlNVEdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130085;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pROA3kL3sIaErzbRbcPua9xTeit6+gafTd4K/7tKswI=;
	b=ro6WYWjjngqL5NnUWS5KMk+akIAtn8nz+aVO4RRyzEHMXDM7j1guIqPBgmwlG6csu+cX
	 R5iB6WYdaLHFM1FO2U+uu4YVhAK2lgptOOUY5irgBMxBV/AnCNzfV4BwUE4X068iEaUQY
	 x/+QdURADtL3xJyQDDABYKTxBjUp+f91vPY6NNffLwiF5CM53KwWms1Hx1CdrTf37LlIk
	 iNGa2mL0MKa11fdqMFsKoe5iTzA2gHduz6IEya0BksvSsILmpfvjOnWjcHeoxzFfF2HAe
	 oTaRx0atSAEMWa7UfUf+wl5LTNrqijcVXvtfDTj6rEBH5O3lCfAAFyseJHKzBkeMqvQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130085;
	bh=pROA3kL3sIaErzbRbcPua9xTeit6+gafTd4K/7tKswI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f+hw9yod9M1wX3srkXBSIPMnk285zt2O+3m0jUNK6fdXeR/rn1C101RQFF+okvZ2q
	 KBFmqorGyf6soLZTkQN1WDBmIwGSlYhsgz6onPBCuGhGiCi4KfyPS/Vj3cAMdDGT4C
	 EkNm25Uvec9WIy+sCF8ySQw7OlSmQdA7/JgOJ/sPjb6bsThf6AKYMksDLPxCiJDEJb
	 trnYJQQjQJJLTVz7MNEXrXEqe0yp12U0Vij4fRq3KILGEtPcmdIIRyGHRcWvgf0gtA
	 Qb3iRzq+IQcpJEYiyvuxqiVGwxjXyfQvXIF1O+SePHW+m5iqh8ikS/XPV2xf+Do1De
	 1hzLvp0tQJtbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A9380DCA;
	Sun,  4 Oct 2026 16:08:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A76E34E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30BC540068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Mjk8LSS8MRj for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 304A140049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130077;
 b=HART4wjkRC6wVVSS4gp5Xr42vWzbeKKdRIAK84R8vA+RsK2joCq7oHezl9MqbmU2lIFQ
 fJm+1gWMZWVAnrdyHZXna6u4XayV/0TRGPKRH/+04Ix1McB/IyLxaY5BR3TRSLauchAIv
 zC3zDF+fCFInHKTYbGZMAUQbKA6F5UB0jgjmsbRlsUDcSgB7314tKRcFqTJfAOKFhWhtG
 cpYv1BtAM92J3EQzUjPBn9MY9TUUyuVEeQ0W6Z1auF206kfdqvNKFsOqcRPdxCHUWN/Nv
 CKbFbHXC1YudDHh3t+m7JM3/4bghOt3u8UQqPIEGTiJ47mgIX70Ap0/Hym5L8w6+vQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ydNYmpa8iHka9lJzWpM7/g6BJ1H3yY5CkXQQ/+5cGow=;
 b=SxFQQ3q/3GGl5S84OxT4mY+adjzr78itEG5evbAWkqhZfESZEYmxJwd19axu186BMw3H
 OscJjWqC0oGjG1yk4nzuhpV1+zpamT0EH47l4Z0xTOr3ou/D+mzZ5LvuQmgamKMEiMMJn
 QJZxigV2OZrQEtIGKllYXDTdE/YcxzN3lK9kr3NHzb6Nb9yZxhV3UY6/TyZ2IXo71Q2RA
 lClC7Yk7qVzBNjIVoLdjhPXcYG5fdkXhgnYlVt0V5fmFTxLXnRwRoDaAfMyAbGSaaOnHp
 brqD2jEfixocbLL9qGGyRZ1hmpVPya/GMi3Dv9g7uJgEAMC8kNlLPzCTh1Im6I0eEtg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 304A140049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D748E8D21E; Sun,  4 Oct 2026 16:06:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:02:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 933507e0d95d5f5c2a0b0f3418653fe5299a30aa
X-Git-Newrev: 28dc0c3ec1d6294689e84bb36171640f14781c95
X-Patchwork-Hint: ignore
Message-Id: <20261004160641.D748E8D21E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-msgpack: bump to version
 1.2.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/28dc0c3ec1d6294689e84bb36171640f14781c95
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 2b34d6a7c4..1669af796d 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  92fa9532cda14ebc2bc41266481e905b  msgpack-1.2.2.tar.gz
-sha256  9eb0b0e602064527a045ea28c4f174ed69383587e29cebe28947e3b84106eb2a  msgpack-1.2.2.tar.gz
+md5  80009973366d78b6dff0e03ca0a6dfc2  msgpack-1.2.3.tar.gz
+sha256  32edb81a2b5eb7cd7c9d941b2bfbbb082fd2cd09e0e725930316af6b708db186  msgpack-1.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 231d4f564c..92e7cf3b17 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.2.2
+PYTHON_MSGPACK_VERSION = 1.2.3
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/6d/44/ea2100ec54d30c46ee9dba10a3bfb79b655e96c6df237238a3234c75869b
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/0a/e7/bb605a7bab2d8425a64b3fa762b39dc1bf1c7e3f11ba6fb5413d6db0ff8c
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F279BCCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0AE440808;
	Sun, 18 Oct 2026 14:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xT6qo3aEMu9H; Sun, 18 Oct 2026 14:24:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D158340806
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333485;
	b=U4FVbZEuzI2RBzA2yUWsvb5orQkZn4SLKbZ1mOz6XkMc+CdKYM/ik8qe41aw6udexzT+
	 MdjfCNXXT6Fm6Wks6roU8v342kCIC/kh2HhIFisOQE/YkEo4DgA/dERj3sNYhw45tAcVU
	 Js1IoFbHYJmaW8D2IUx7eZ5VB36OcduB2PFmNGAEESByxIquIDNVF5TfsyaIcS5wBqdlU
	 4yzzjAC15Fk1xffVxVu/orZTrNF7fDpEMYwWh8+WUfYRH21qWpSCfvemqjFvwemU9Hgnb
	 8tRPPbcAHC4W73jTAMssQRHzL2oMnV8MoVxfO9ksM6qEl6W9B20JqHFFv7GB+6CVXHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333485;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YukMaVDkd02iQe1ldBBSdEslhQtLQ+wxSCYC/5DOSzg=;
	b=soOas2UIxYw78tUW/wrv2MASuToN+vE1qyPfAXgkbZtG71Cyn1GkP0fKlWNp8sY901e3
	 XZlfkKrW4jzHYcY2zGBK/VBzWD2EwLxpDxw00ur1Kc7aGDcYSLVF3Qh3Xi2OBLRJjgf+x
	 Zu2fs0lXsBWHoDZNEtI74CrgMD3ZqAFltVhVNS141kbMzVrh51ZFhM5G/yLnoITDbQxyG
	 US/b2LWT0hqIHyP+i4wZIExzgyh3aG43z5juZzo9UTnmSEmThjsARQQTHQhx1d9CAPbjz
	 l/BlqT/q8OW9sHY3RgvpgjKlFwhWbsJjKmykqKhM4Md2UYVud6mnuGrIIfW4AW+yUDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333484;
	bh=YukMaVDkd02iQe1ldBBSdEslhQtLQ+wxSCYC/5DOSzg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dpzqqn8YsVktSrlTR9DCJaDkE7nZe+GMtKo08jc3upO7QwmsCaOPidxixqKx/OjY7
	 GEowzAnpbpfUlur2YwNjVpBVfBwBcRoTyZ1UPSMonpcyCX4QszbMFUGhX1XCOsHfD+
	 QI99+NNpMtNGXr4klaf2YNrYwp5aQ1KgVjrTKpsAa9fpfZi8JvB6b1juGfvhOcNYyN
	 e5iUlKn993Kgk0Z0/1dQaL5XGe+Yh0V0z8t4/6MWv/0VjFb1RAuxnsjTywiGGKxBTt
	 Mrv/KWIiKDQhdKWVl3LfItOCUjyMyhke32Dj/OxfPqDRwcsgIrisaEnFFDaoICc/85
	 1aTEQ2IiZoaTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D158340806;
	Sun, 18 Oct 2026 14:24:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC962255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 924A6400E0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkHqMOt3Vp5Y for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7FA6840207
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=HSQ0dsFRdPLVE6zoWLa1uwi1UTFsziRGYt5llsyL5Sq+g/6daxpac8Ae+pfFem4Qr/aZ
 jRXr79JqqUwpk2mhAd49+iNcfnw9WRTiCXo0SPiSh3c5s2FMycOZDlgEOWM4kU+wB8lCx
 dXVmgKo4Cz8yPu5U7KpkkA7nKPZdlvXR16dhRIBuLjYjscWdh8e/+BIi86f5RbLYvNju2
 ePEri2SNfMN4bLbEKmHOuRPyZrq/lmGiEF+Um+o04fxog2rtp7kQhTx9tXbC+x1hao12F
 w5yhlMhMvnX+GcQYJvV1mRFuX7TvksJqcLntMqCD+fctXCpOubfwn0S7tXxihVml4Ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fgRUHew4kCWIJecdoI/swaSQmKAEq71gpeX91jtrXCQ=;
 b=ZATKptEFKrCpdEBSKMHmvVf1pObzkxO4DuT0GPpyRA1i8u6mmRhXrmdefeyY+SIf5dG5
 vVCNs2bIYEuhQP4db0dY5/jM4XhR7vnNPYxUU/iWKCv/mjiDzd3nhhPnwFFwy578bazur
 kmCpM9jQKTf8U8JtB64cqufHNfWEcnk1RvShOdu+4i2T5k0HOvv8OFfWKut+W7KjoP52j
 UldZ9J2+xEiEGDYwitW/0fvcvHO5mx2c8MtjTUPbYiApIIa7JO3uB8rdBy7HSld/inR/1
 //x33qu0pKqU/i4f/riaC0AckGSzlDVzE2rT1Bab5CxBtmzvd5yWh1evHdJdeyJckyA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FA6840207
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ED189828F; Sun, 18 Oct 2026 14:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:58:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8ec3d38b971e16aa2e15cd03a1adff26ea53d53
X-Git-Newrev: bd0af3779b00c04d2c30a7e776e6d0a49f342c2e
X-Patchwork-Hint: ignore
Message-Id: <20261018142304.6ED189828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wrapt: bump to version 2.5.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd0af3779b00c04d2c30a7e776e6d0a49f342c2e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wrapt/python-wrapt.hash | 4 ++--
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index f384c7a016..3092a879b2 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  62a3f2bb129e77c859aaacff584c53a6  wrapt-2.5.0.tar.gz
-sha256  c48cdb6c904dca76d9915a579e4a5fab6b0c25f650c1019ce78a78effaf7a345  wrapt-2.5.0.tar.gz
+md5  44850a284b765d6e8aa1fe09ce5fdbd9  wrapt-2.5.1.tar.gz
+sha256  f595bb0185aab3e9dc31950c95d914f56ea8278810c3b928f3426e12ed6d27bc  wrapt-2.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d4f66854a24dda2f2a5282912aedebe6b18186b86284510a433d78fadcd88e5d  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 7c3f4152a1..29f8dc12a0 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 2.5.0
+PYTHON_WRAPT_VERSION = 2.5.1
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/3e/d2/a254a26d8ceaea87e0eee2e89fcfe53ddc1858418647493bb2937549ab6f
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/04/22/89e2f3bdae5cb34e0cab0cd86d7172dbf418de4b46c9b17b9c7a560dfa44
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

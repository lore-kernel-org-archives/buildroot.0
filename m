Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97860CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6013E60816;
	Tue, 13 Oct 2026 20:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAg3oTaREvnQ; Tue, 13 Oct 2026 20:53:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 76FAF6083C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924793;
	b=oHcCye5Bw4mTVzSp85fvMpzuqbzh95KEc1x9WlGIfjyPfqwN4gAmCTxzu+XKd82X3r2L
	 x98Qq1F6WsvRvx3gMn76vQYtTEBH4dFwLFnMWPcATMg9TPinrNPtVVRcqavPXi+b13Rlq
	 0E7yLaS8kP1Te4sXpRqJNzWtj888k2G1mNIcsprx0Oe5SyfgInu4PF2GmuLIFBQqGcBn/
	 IZm3/K6zCJ42f76Zx1zkwVGWAvr22DkBx9aiOgNEBQPPt0tS7PtW5P6bOn7gP3vWxP51i
	 bKNO8w0b4As+ueGJQ/yngrg3bSa5QuOcurOPA6tTQxgy2e0ima3wYKDpKVen5vJj/+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924793;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=q+0bJGgVRaqcNV09k0schnKl3NkxJwx7yOEKw/fI/Zs=;
	b=bFKrPeJauHzBH6I9rCXg0C11g7fe/V0mvMM+mlyqnvMGfXV7aSP0pMQYz45TzsuBtxuX
	 1z+LOaTu7aUN+HhMhnBDOxFgXyf43Ku47BsuzjjD3Zd3WCTtCqa2yN9mvoKlwcjEHKjfE
	 LmW0MdgXlIZae9qydqKiZav76gTXb5GDfrrdWRL0+iTs3FCsacv3z6drqsBA4+QRVQM/7
	 /OY7oMyiN6ecFCh7nvOWNe+YhZ8qN56FkRygWXN3+PXW/Kbr1lPM8T2IUiZPQzYBRifve
	 MBIV/2Z0PjOlrilM1LJBU5jx312ARED91pTdwB+gqoej+RzhQc68MgDZ71GWcPMFyhw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924793;
	bh=q+0bJGgVRaqcNV09k0schnKl3NkxJwx7yOEKw/fI/Zs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EGKrciCCMgPcKi5vzI+jCFyPSiA7IeEVb/frzXTK8HHBYSudVoZ0KY37I9kxmEWIw
	 J9ZxMPKgU6GiCXVIiiNtTdXw0pEdVgBZ4CdDKogslVl8SnL4RCc7wLX9Aj2ly+/YOm
	 qvJdRF4Z2aitbWify2tvlwKD//x0oLYs2mOwr3DQb+OpjFrOzul7wU36jcQZEtnAto
	 nNdD/HA2zaGYr+0Y6kXKoQky14qZM3ZlGkeupek6GYysQL6SbZg4i1eC1i2HgeR76u
	 2fnayVYvN5LTBl9gQw1mbTNU4su8qYACPkZznhCA3ecHsKz4zlo/FVgi7tgRQdP8dW
	 BfirElsVVwx8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76FAF6083C;
	Tue, 13 Oct 2026 20:53:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DECF5788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C32FC607D5
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayuC4ttaKU1i for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 025CD607C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924747;
 b=WD5tkL+GMXE3kllo5ETP8NcHHSJxhrWXNpw1PFwhrvDRK/nhjaHh0TxYwsuQBUv2fZ9z
 zR30pPtk/cNY72oSWl3MJn4tESz8Ckm1fuSHT9xqQ0KomWXOOGvVnulEPG8eYfH+FNmp1
 Q8PisbGJ7SFnjx5/P6CIHpLyoj/FIYulwqoRoQLgzVX8MoM07Dc+E4rviF7dEpqZtDkgb
 5ZAr3ROAAqmYXZnaE33JTKhSNSTwD8pe3vSC9puGkYx8jzGWY3sibE94R9zQZYw67VcDD
 80MePZyXTuGmGX5kpXIdYaeZ09AgKc/PnKy1OieDtxlK05oNqAJu8W6dauxnzX+Vrvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VbDpVdgIYPb6v5Ew8lmKgVdCtt4qCR84360ekJeUeHc=;
 b=goebIHZkNjbOBeJ+rIpR+l6ni90zbmUTnF0cACnC77uBRI4msyo3wk7CNl+eiSDxXCPj
 fuB0lPCoIYrKGFxsWdSleOG+eSp6su8PnKc1clouViDVhSAwcgd3Jc7KfePHp7onQk8AC
 4irrhnKXJ3QfYzCvAi9cGXHKISCgtbgGuz4VlVYfJowbLifV7afIof6Yzut/dDOeUvHwc
 +oYNdxJpLzO59W3r0l1cYmJUw3fc1Duvs/GOruQLYXEnG4W6AFqL7KUzuDPL2GiMN29V5
 tsMT8nM3sfwaqe3TpDisxH5eIs54nxMTzzIyONsJwrbyeK4hrnmAsqtyNMPv6qlRwbA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 025CD607C8
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CAED956E9; Tue, 13 Oct 2026 20:51:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:46:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c01db167d2ad84ddd74a55472b1f5c3f957dbf4
X-Git-Newrev: 2505e109f0e06406b8ff4c50989ff3938a2e5d1f
X-Patchwork-Hint: ignore
Message-Id: <20261013205107.3CAED956E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomli: bump to version 2.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2505e109f0e06406b8ff4c50989ff3938a2e5d1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tomli/python-tomli.hash | 4 ++--
 package/python-tomli/python-tomli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
index 1de6f54504..fcb52801b9 100644
--- a/package/python-tomli/python-tomli.hash
+++ b/package/python-tomli/python-tomli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli/json
-md5  74df8e3714ffa480b8076c98247ae1d1  tomli-2.4.1.tar.gz
-sha256  7c7e1a961a0b2f2472c1ac5b69affa0ae1132c39adcb67aba98568702b9cc23f  tomli-2.4.1.tar.gz
+md5  655f6b8d7821da937044456ee0d527d3  tomli-2.5.0.tar.gz
+sha256  264507556cd8b8c8e7c6ee037cdf443a463f03f4c958e57195e3d369711b8ff6  tomli-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index cab8c5c266..a0cea7a82a 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_VERSION = 2.4.1
+PYTHON_TOMLI_VERSION = 2.5.0
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/22/de/48c59722572767841493b26183a0d1cc411d54fd759c5607c4590b6563a6
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/b0/78/9ad63712633ed3ab5cc1a648d863d7e7da371e9425e209555a0fe711b695
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 PYTHON_TOMLI_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

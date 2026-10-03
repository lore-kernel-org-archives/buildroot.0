Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3312DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F398C816F6;
	Sat,  3 Oct 2026 15:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xjs9CwOhCSI; Sat,  3 Oct 2026 15:56:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1C18E816D6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042986;
	b=Hjko51fLG+NjfMDIPwqhSDcCOtfXQd8oVAApm02W2bATkwvuduPnIH1u1f5cZx7SFUDu
	 HoVbrZh64KfJ+b0n3gYrfSsEP6/TR7L+y2MNthX6yeTKeDmI3g9BVPFAAeARXEBbtJVTg
	 6jVN4/POCBw7l91c/JtzI1h9fGs+U+iV2nvX39hQO9iUwJ6cf0HFUmXLeYZZUf9qEL8Nx
	 3m4n6+4cbRnT9XfD8gP0wvp4r2k7icHk3s2uWKvNRvkYf+nmp7DkSr2Bd5qx7kjlofNWx
	 N7h6Y/0KdkUJML7eQ3hzh5YHIIW0QtGbV97FvrjKrSCiod10jE74xSf9xYh4bTV5LqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042986;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DRvalRhD8kJCB7dMDPW846t0Ye1sI7sR4cGKAgqtcCg=;
	b=BLK3UuDvOBYZyGRuexUGqGQyChDu3BRXSW9CXKCKcpIfbDLm3IopiU2Piu89iDVUpL2E
	 4Xut5ya/EKj6RRnxpm8Yslr5WjQxmHUVNUGWr/eciUprXqwhRXppPjvEQ87CcHX0/KJju
	 ci8nwAk84q5zZfkINS6Gw8ko+7DhriYkWefJO7BUGV7rM6V1QEXhB3Mrn1+PSFYTW0Hai
	 s1U1phd+Ow7hvArCiGOTc47JhUgaypfan3/bdAjaQJeSzht48yhk/fzrL609pdCTQl6AH
	 aJn6y61+dHTs5heuG7jyxRAZg5/1+AXEO/66lXo0/nknq2IrMBm55LoFgIKrtdBztIw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042986;
	bh=DRvalRhD8kJCB7dMDPW846t0Ye1sI7sR4cGKAgqtcCg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eQqzgZPCBwtifem/I0TMGXD6791zJv7XEvV1tbUvdUY9vv0Q9ydDaIkDsRzcSWQE1
	 b21DkAoSwD/iqbJPQnbbgxEk3yAJL5iQJ/QQxz4bznd3HjSlzCI3IAIRZkQrKlsRc9
	 vHgQSVYgTJZHyzlx2Ue6koTHeZID7HX7fRpNx2LEXd4Sts1UZN63P77L6XELSOzIdq
	 kl+8M7sasI+XG3P/J455lsjM7gQQqBZXBECr1khxG5pHQYkeHq1iKnXPRZndaV2X4q
	 DGCyduP/61rh2b4AkkqhHE5Hehq5xiodGlLvF6wOPgs4YvvW2ytFZbV16X0YcTGZYB
	 k1Uu0N2GNuuHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C18E816D6;
	Sat,  3 Oct 2026 15:56:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C36B7476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB8BF6063A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z77Xs8L0RMrI for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AB2D160683
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=ltwHzy6vsFj6Uq2J+3izGxVvS1Hlsu7wLY3g5Ze9dXhFNuI01RfgajSd6l4/UgFtCzNS
 jjP+i9XW7FX2qLoVtqnFQztHNvDLvhSc3amIoJdv4Y7MjuNlDN0odUlIxzged6U7Vx+Vz
 0Hba9j1f7Ev/++q/u4V3EYS1Coa+lf1bL6TR/1pujq5uOK0MCBhGd/mXv/qM49c2NcaZA
 fs+7adv7TDutz32+IeeVbxVY5XJtv8D9jgfAbVRJUR6HqoT9pyhQIbkKj/VSqf3Ej7p1u
 ms5za7i/jwfwl2tLjLXQtmgGP7ANas1V+J3WMMFCaUPf2naShucgxdjWvHlhhd1R3dQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yGLp/iWIadqmvM2JQFID4y2oy3dLgCthT3xDopRXfxQ=;
 b=S5ElGz89Z6AKS2Xe012n5aXH+AAlwC3XpgqCycVqytVqogQNzpwOI4BGTSbGMxXikeeQ
 4LW5SzGQdpIRt7bzEYzOjs1oK7yKa45KzK7G9r3vlwRvDE7LRPOf9uWBe3aBertfik5/u
 5E7uCHdcCyesNBfJx6GQHAD04iWSyHuiR+DxQrvRWnYydNIew30wZZ96uuYUUHdqREgHy
 dOlYX0BFvTzI90UkWsSCDdqR/rowl3EavsOLp/4mAG4a9yJVnra61LnMTBm00i+l1VoBS
 Avy4mkxXfFqO5KDNzkhpVtUNr4Oc5wnUpAopLgwYTz3CjVlStxJDwY/KcCRJdx/AQqw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB2D160683
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA4138A574; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05b806c6ab12b9bf46cbc6dead4eabe09a4dff8b
X-Git-Newrev: 1383236e2e1ce1936739408e69b7b30063d3f590
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.EA4138A574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachelib: bump version to
 0.17.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1383236e2e1ce1936739408e69b7b30063d3f590
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cachelib/python-cachelib.hash | 4 ++--
 package/python-cachelib/python-cachelib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachelib/python-cachelib.hash b/package/python-cachelib/python-cachelib.hash
index 0ae8e5f10e..f71be417c9 100644
--- a/package/python-cachelib/python-cachelib.hash
+++ b/package/python-cachelib/python-cachelib.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cachelib/json
-md5  4159f620b8800fbe104f20ea4702e16b  cachelib-0.14.0.tar.gz
-sha256  73fedcadd0ba818fb2bb9f3c7cd5fcc2a71e86286f1842f55f28d500faee17f1  cachelib-0.14.0.tar.gz
+md5  e57c5f1465e91fc49c91ef315fda545b  cachelib-0.17.0.tar.gz
+sha256  f3c7dc8d3c1132ab699681ffdf8a52d341d9425ac1401c538cf0b1d87b1677c8  cachelib-0.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cd418120812dc2626281ae027e81b648229d166b5aca7472cecd510038d36e7d  LICENSE.txt
 sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-cachelib/python-cachelib.mk b/package/python-cachelib/python-cachelib.mk
index 937925e1e3..ab51cb586d 100644
--- a/package/python-cachelib/python-cachelib.mk
+++ b/package/python-cachelib/python-cachelib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHELIB_VERSION = 0.14.0
+PYTHON_CACHELIB_VERSION = 0.17.0
 PYTHON_CACHELIB_SOURCE = cachelib-$(PYTHON_CACHELIB_VERSION).tar.gz
-PYTHON_CACHELIB_SITE = https://files.pythonhosted.org/packages/66/a5/5eb041dbee71766704d44cf5dfb6950ab018be0fd02cd763ade09869e33c
+PYTHON_CACHELIB_SITE = https://files.pythonhosted.org/packages/c6/f4/b20875916b83f68775093554ce2544b12255396ba69abd93d8903cce0feb
 PYTHON_CACHELIB_SETUP_TYPE = flit
 PYTHON_CACHELIB_LICENSE = BSD-3-Clause
 PYTHON_CACHELIB_LICENSE_FILES = LICENSE.txt docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDD1CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20C8841184;
	Sat,  3 Oct 2026 10:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qorab2mis3xS; Sat,  3 Oct 2026 10:07:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AE4004115B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022048;
	b=s1CO26Lepu+uhKF3jVtojAHpCLb4XiNBnOsJp2ABbJmoBnerMzT0ERxLxubnyyBbfp35
	 +xGmNltRMNgsdOvjQMUMcxcRS+r9VQTermP0NBjmSYWIxdOPvmo3phzfosIIEL1GTx9h/
	 c0iKIaSsT8HfE0olV4MmgkyaXJn37OpIB2DCC2o/AjNCiyQK5IwN2Qf0Z587ytwbNd58o
	 vHM2TPixIrRa1krS+GmOhU2R8ZZCAPi3IEK7Ml2wwj0W6nBNh7FHOwqtoTvWOGWweq9zk
	 hMWL0aqnKfl5o3awwjSTIZnlMGBO6hSxyDxKIfu9veY5Aec6cxtSVulxqCG+lu84utw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022048;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fsVfB38PikZPHjiwZAyVocRnckKxb54tR52lsqEQ9iw=;
	b=HvY/lSxH1WZ3Unouj24U2FPNDpBBdL9dXZRMESSQI/c80qOOIjjKClRH0Y3B2FE/sjGW
	 qZ8gooO4xhPQymJjm98JHG9LpScDp31HTQoFcqswOaDbhf3IEnvDnArvurqqRIz2LadIJ
	 gFbAlP9+YV4vFdA5Z8cAx7KcS0TU+VQcoZcP32jImBgaRy3vQNei58+mX9rjdQFnYgeuk
	 9mGhe1kAtzDQxoOoxxuc+gyXpGBfKKccG50nGhi28ReO/utGGuTLRdMAeFK0n7Dek2/5p
	 0nNfxWa0SJgKcn1M4lS+uTu5RVNgrw7fUj7oeOhYqzm1nhDBGeb3xePQjrLQMDp6ksA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022048;
	bh=fsVfB38PikZPHjiwZAyVocRnckKxb54tR52lsqEQ9iw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GO6ycF6g0JKGGZ21+Wg1pKBhaEu0l3yr4/PlMqMvEkvCkg47sO8uBx0wjfTLdfEIw
	 dELfEOoIJE5xiUVNr82R0bTZ0bPTfmV8dE7tSd6I15A7I4DyOHKX9ITjijzzvSPAbe
	 tPyXBWpgzL9y43gsp6fN3rtnSzDnx/2GQes39RgbIdw2kZQPnBwX6Bkw5/wLHQhgtK
	 C8BkKX1KTz791A3OgtDEOoo1flL2il85y+FfkYpy8kuvKlB+YF10AELg/BXTKM58wl
	 UEiMeu9F1WJGOyy3ij6FqNHa/IBLmClaUsxACEtLamjtV9i4sO1hlGAMYLSo42pdxc
	 kAoPy5k/2siPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE4004115B;
	Sat,  3 Oct 2026 10:07:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33FD4476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1455260E81
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjRnoDhBg4Vh for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 571A760E09
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=k6ASQGXy3jxuHLuy1+Xi+UPWn2t6PVUtFaNdO6dV2bLpWHtEnAkYYz/7MaDd5gYU/xOP
 E9FwRVCQ/cFYkJOIwAKmheRfsRkMLbU2y237ensgNhPrVIu7pwONGKYyv+esuaoE/OFXS
 aDOdYYZA91D+rHJJNRqeQ8rfpCjhGxs/tlHmsWvg4Y7UVrS0kr4TscAwo7AaRkqs4P8/q
 tah/vgyFRVqf+cjOrVBFgyY4u1t3/rFf1JCpM0k2Z0tdWsmhKKnvM+UTvbHrQbTXmT/gf
 MHlxLyImvGcZSJzTAn1kUxMCcW0mb5YDN89VeSpXsv5IvfpgudqsrnHNY9vV3NJkEQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=D6FhVApSKU427fHsb4G5tHzih40uU8ZoHFvS4vXqaKw=;
 b=cMq2dnsxGf45jSPTUlqbsLK8WqvpDb7K25dXHfCtHzwvpCQbFWX1ZeiVqUzRx/xUGDQc
 +8Ss65ALhiAdsq7oPAmfX0FKjsIcG6uKc+0t62OM3Da30yW4qvfTMcmA+fkN1096MpDiE
 tV+5uVnIIg4iLtgpJ9t0nqMyQGqC/xKEzVRdITyPcypGg2/9zV0BAEiEytcaKHzAvnixP
 A/aCZPbRPz5TRpQ2J3936PURI/diWdTQw0AVK+zH9Mjurv8nCIZM3seBSw88zdFVizVuE
 4YFlnoFKEVzPwcwZWdZN+MleAtIQmQgALn1W2rVD06mu6WRqpLefEAti9h66vwFv7pg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 571A760E09
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A655888824; Sat,  3 Oct 2026 10:05:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77e4be3ed6002e0c9e36d9d32aa26261b52d6c40
X-Git-Newrev: 3abe799e44cf05d86f97a48a9e04e39c7b663587
X-Patchwork-Hint: ignore
Message-Id: <20261003100553.A655888824@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alembic: bump to version
 1.20.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3abe799e44cf05d86f97a48a9e04e39c7b663587
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/sqlalchemy/alembic/commit/9400ec85a13a9330509e67445b939d79662cc6cb

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-alembic/python-alembic.hash | 6 +++---
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 7729f97a64..2f886103c1 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  747400a534b73635c91d3b4bb71445c8  alembic-1.17.2.tar.gz
-sha256  bbe9751705c5e0f14877f02d46c53d10885e377e3d90eda810a016f9baa19e8e  alembic-1.17.2.tar.gz
+md5  d221e130339edc326f8333cc315e8c32  alembic-1.20.0.tar.gz
+sha256  db505480647bc60386c5369402f4a57a506b7539c9e9ef5e270d45cbbe4939bf  alembic-1.20.0.tar.gz
 # Locally computed sha256 checksums
-sha256  35ea9c3419b261faf1be448c4f47d9255281bf6b36b5ffea55052227d4ba54de  LICENSE
+sha256  6e68d94a03a0e3e327ddf3e86d1ebedc14eece3922022618fc246a36296fd0cc  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 530b31246f..a940e14eeb 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.17.2
+PYTHON_ALEMBIC_VERSION = 1.20.0
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/02/a6/74c8cadc2882977d80ad756a13857857dbcf9bd405bc80b662eb10651282
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/ed/aa/02910bdb8e2f1444f6654d5b296cd827d126f82209050ee7b1000f92ac4b
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

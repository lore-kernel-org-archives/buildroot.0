Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEC4CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4477160EC7;
	Sat,  3 Oct 2026 10:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9md1OTZKx8E; Sat,  3 Oct 2026 10:07:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 523DE60E8E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022073;
	b=EAGnnKDG8SOSvZTm0vZ16j/qxLuFGK4wLpgvAJAYi45t+AhDWKfMqgWr3l4WeHGzVinz
	 KfCdsw6OIHYqfh0A+vlZ2lf9EDPaPtjyhOfh3FAko/ML2p2h51JAdc734stakHQlzaSZo
	 OR1D5NrttK4MVPKbSdLyC3WQWs8iuA7zV19va6ZGjnk9gySKBe5IEgDVNgbYxmij68xJ+
	 Zs2JJ/h8GFpdVnu4i+uacOW24Hm7qinIHfOWKBbGWdjjK/ycFePsWfVcDWhlW26pm2BR4
	 IAd8joggvEQ+vJ+RVgU7EwYA/aD3pLSPX7TONIu8r7p9PpPh7u1dnTlNW62hIM+WcHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zp2VjH0DE+OQmVdIRafoTTtVOfUE0w2kgt1WrF9fgE8=;
	b=OS2jOzXJ3/DsCzKoOXS4D51sS+3fAGL0AS5GObUWSpYel0keY/eh+7jaHFN8VCqIyFDQ
	 K7Pz7nv+kdjkkGO3+ku2dMa3+Uu+EDUZOvTrmhWcNrYzIt/h/Pep0Qn8lLADMpFDsOCbd
	 aT3DB5b6YGagw0G6v5W8zairjT+ZjNhKN0Rw2TwgWagH2yTHFljihsoAXYKGVCcVJGqwJ
	 HZtqXpP4P5gczqoYrTwZAn+HcHp1WImHMYSKWSOo+tmRxuRWBRUi96Am9iWzQF29OjScf
	 eE06Q3HaGN8q8ppP1KdT3hwcq4vbSHC0vrINSLCZ7jH3B5S6fg5GGfqLoNSnpMmEmJw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022073;
	bh=Zp2VjH0DE+OQmVdIRafoTTtVOfUE0w2kgt1WrF9fgE8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NNbG4KvZrydordn6zL8nKQbm+Hd0DUwm/9cBhTmDKmvTJBxWBbS19t48pmcTNW7cL
	 rQ9tPGjvOJi+OmuCMRdygtieAEcXdusVTXkt+Wg6pWf9DBxltFPp7bRyD7XTcIERzI
	 XhOyzrTl3JPWv2ig+ftW2E7cN4Bs72jE4HYfzKu5QG+mh+SxO7iUgS8jZz7AIBJeR8
	 T9QErCuhvJ82SfYgkwaJjIwYJsZtHEDw1/WTsT+xQTQVJbeytqM2tDHlo7oOAX851H
	 3QKfJOvifQ8wLJTssUGL8A14I5nmKfYFDU7nC2T8BfBlxkg3WyEgsCgyRETSglen4+
	 Fy94soamYhIlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 523DE60E8E;
	Sat,  3 Oct 2026 10:07:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32B06A10
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2344860E82
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1P-FqG7e32j for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2865460E8C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=jaFeNa0W33Xze/Hpu9vK4/SiHt3xR006CJzXuHQA816yeqcQ0p6cmyyKrU3PL6m6DuiB
 YAnlvNsy8AE5YNKoizLIMvWTPSNqZBCwMRQauF11x9IPJcumOohSuGEtc9yfZcnbnMVsh
 TtLpSBnQ4oBPpk9qbaorWOwY4J+jQ5swgWu3CR2RUu3p088BXahHeVfydp3vPC1OIpt3J
 UweJ69XBooMrEfjXAQaAyb14ntzIpiXeI9pGN+xWh3mMFYxAx7aqOpfqgVjgvpB11mGdU
 Ja1t1tgRmh4clXuMcyC0XtTGH7sQFUQD5B0BN0miC6V0eEmTEDaoWVb2tAfqEZZqWDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZbfwLw/YwXJUwjxcbxiQw1jbmI7L1kmKUyDkZ5UTLPc=;
 b=no8ctPMvMDFmEjPKagT3aX9ya/q0S0tCE6mqBOgwm4ZbPvEbYlEpPVSNFKPMkkBhSfER
 1bt3NMTBmyP2HOX5LvRzXXwKielZH7IAQNtHDOBP7E69aOa/Tmf80o85PatBCtmP16kJa
 +mGF1WX401AkLP80zygFC6yWbDNcup0fvgxOdg1FScrTAtyZ3lfE335HRRHcDdy+7JNc/
 DNCnrDNEjU7QVd/4uSNQy8ONeUPIOWrjqkHiRBk7LxP+J+1ZSauFioNmGksVv0FiNX/xA
 Etm6iag+5RhHbyuKh8Rj7Op1kM6+eGCYjWNMhOzicC1fPs8iQPxv+C+L/qmY/MHjdNw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2865460E8C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 862CA88762; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19b3c32de0491c0f83497327ab2021a3e750af84
X-Git-Newrev: 9907533798ecca28c12068605fbb9d751880691a
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.862CA88762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mpmath: bump to version
 1.4.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9907533798ecca28c12068605fbb9d751880691a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/mpmath/mpmath/commit/ffda440b4d90bfb6c0b78db9f9e4a0171b2e77bb

Add the host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mpmath/python-mpmath.hash | 6 +++---
 package/python-mpmath/python-mpmath.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-mpmath/python-mpmath.hash b/package/python-mpmath/python-mpmath.hash
index e402647a59..2c50b2867e 100644
--- a/package/python-mpmath/python-mpmath.hash
+++ b/package/python-mpmath/python-mpmath.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mpmath/json
-md5  d5d17bbefea73eeb959967351d905306  mpmath-1.3.0.tar.gz
-sha256  7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f  mpmath-1.3.0.tar.gz
+md5  76a2228197ea084926c3d72c31ed1a28  mpmath-1.4.1.tar.gz
+sha256  efd6d1b75f09d69524a67609949812668b28e81ecbfe0ab449ced8c13e92642e  mpmath-1.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  c26cae81da4508e5e249985777a33821f183223ebb74d7f8cfbf90fe7eef2fb7  LICENSE
+sha256  01cb9dc26c9afd5804c2ebf72f9ef03b5fd48972875ed59a483a45f441971f1e  LICENSE
diff --git a/package/python-mpmath/python-mpmath.mk b/package/python-mpmath/python-mpmath.mk
index 86a3562d04..6abc5abf4e 100644
--- a/package/python-mpmath/python-mpmath.mk
+++ b/package/python-mpmath/python-mpmath.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_MPMATH_VERSION = 1.3.0
+PYTHON_MPMATH_VERSION = 1.4.1
 PYTHON_MPMATH_SOURCE = mpmath-$(PYTHON_MPMATH_VERSION).tar.gz
-PYTHON_MPMATH_SITE = https://files.pythonhosted.org/packages/e0/47/dd32fa426cc72114383ac549964eecb20ecfd886d1e5ccf5340b55b02f57
+PYTHON_MPMATH_SITE = https://files.pythonhosted.org/packages/c5/b0/6de8e78014ff1842a90cc9a56da6ccfb598a5390ed0257fcdb7d9680c18b
 PYTHON_MPMATH_SETUP_TYPE = setuptools
 PYTHON_MPMATH_LICENSE = BSD-3-Clause
 PYTHON_MPMATH_LICENSE_FILES = LICENSE
 PYTHON_MPMATH_CPE_ID_VENDOR = mpmath
 PYTHON_MPMATH_CPE_ID_PRODUCT = mpmath
+PYTHON_MPMATH_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

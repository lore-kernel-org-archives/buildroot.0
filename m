Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F704CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A975411F8;
	Sat,  3 Oct 2026 10:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oqalM-gwNBk; Sat,  3 Oct 2026 10:07:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 419C1411E8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022071;
	b=N8uBRTnRC+3k8/y8KC1CdoUk0J+5HwFWMklBNYGH8MxMeiOoEzV2ajeo0489B0gYgkJf
	 lcTaB4PHqNS91XcjvlSZswTlh4Hqhmq/yOp0DVAE5In0eEil+zlfJ5seq0YafJD6uAyyZ
	 DRPAJv0yGwRi4WcW8wO5CxX28BNfM8wW8Vrv/1bEGa9S4FAhpqWfPJ2DBxn6Nm9RHFQ43
	 t3r/9Uz6+85f+BYV5ala44bK17XWh1jl78OWh/H2MNNN2pV379qD7MBIkhaVqp0+HmWNh
	 LjB7vxknOZBu0C1/L/MHSBLNKnVADgVGdNCYXRs5OiTjk2lXxjy/0vqY0fVNIX294Kg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022071;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=G77rpiZGnHWaXuDIjUKH9jLJSKtjxQVR1Uz6fx49+fQ=;
	b=jFotpp3y6PKd5TRewOsR6wNfwFcMY0vGUlOrbouufjfuGy/iRDZJrK9ZAd5YbkoIzjQd
	 SCDfpDuSuFenvtSwGhVmZlJzuTWZv1kpcALF2mTNZXzVhct3VZoLg5bXMEbX+5ANAs+9C
	 yjkitzwCmNOQgDg9fWxMK9JqVXwSZWFOA9k8SlOIBRGosOYesuCmBY0H2KJmqOw24vzIx
	 pjI6MGv78lhxu+VXENCI/Q7L5yzl+RhuhGqqKAb8chd3uHObvZgtlBiViTtBYNNRtT+l6
	 Pc77qb6uZa15JhscpeOgRnFRAHBTfICoy8BSEA+xU8VwHI5J72nABBTF91X00VOBzOw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022071;
	bh=G77rpiZGnHWaXuDIjUKH9jLJSKtjxQVR1Uz6fx49+fQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XtM7eKdW6Vn9aoJXuwZwDvEF+WCDSrM1cTT7PDESgH0TRiLxnfxOVRtp0wg2m9R14
	 99mIVhGxEtRhxw/dA+AWU3qUfsLmm10LuMQC1GXP7/t4e5jm36z2i9W1JUT3QMTqfq
	 YzLlDTav68Qpuf+N3qrFdY/LemMYOOZN5M8VGavDIeAjMViCnvcto42UssrNKfANAq
	 Vc36oCCsxRAce4M2+zF17rs2SFj2vBjeIUvuFEwOBocFXQy4PE5SSXpx1RB49E0viJ
	 XcALlKmtIbxbjhsobIdX5wbOcppv7QU4yEwM+PL3Y80Wpe0KPATCdl9dErB69VwKr8
	 C/ugGxPhE1jNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 419C1411E8;
	Sat,  3 Oct 2026 10:07:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B70CA0F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BE8C60E81
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sag38bdjkLZn for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3CDFB60E8D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=VZPtoEBtmj2dyWkzbqn6Yi2XUv8yCO4aHhgCfjizWTD1TkBjF0FMCE0Jk+4FrjyTwYxa
 1ij3uNORRCaNSX2SD9fY8OBaf6F6jOr97iDvHP2usWpFdjopiL62/WEVyFEFbjzV4gfNJ
 7ju7+16rH8gWHJMk/SuhsRlo6isFVxxCRQXK8z6NBxdwRCXt6tCux2wCy6dB9ejyKpHnS
 3SwcUL8rKjKKrMvuxMM2mM565KU/11WkNowFp4+bKN5Gnl+zYfyPElBdq2qZzljcLKl0q
 WmVjedK9HX2lY0iDMu8Apg1uRVmAZVGfRcYReG1wNZzoWlN+ehfO6vD+/DPfSfh4yWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gDTuqvTqL9BVmOZZZR3t6l4olKuiJr45c2ORxV2h25o=;
 b=sa4aRSznue+0e4cQjhoEXNlDnmsATixvSptSE21GHEdHYG3mehnXNadC6Uorlmlluu9c
 hvrcBiA1wL1qlCwMNntb1ZJpPBnpM2r2ZCmtoopFsKXsThQvmqRTd4X8cfGd31jmsFkn3
 39HEtkrkJjbIUm9p8SXENFxF2mWME3+MSqVFxwS6IYabsIw7EHgtSeuuv8Lz7qQSi1T3p
 /Dn1g+NDAKd304U5cgjA2Pe29oQqaxJ9n+2cscYMqFbWcpVSthqafG12bfeWY7+MHKuhr
 EO5MvdPOaZm7vsnsvDLwaqk0aKB30xmpNUSsLt6QGNgJ8sdzMih1tb/mjfaaywa4zGg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CDFB60E8D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BA068875A; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cd3be96590717be41c8df499433bc3f0611dbed
X-Git-Newrev: b2cb9f457c96fa6d093339411aa8c16f59643b84
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.9BA068875A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-oauthlib: bump to version
 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2cb9f457c96fa6d093339411aa8c16f59643b84
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-oauthlib/python-oauthlib.hash | 4 ++--
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index 5ee9a0ce05..5540760118 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5  856bc51662afb26ac58b1d7742606b2e  oauthlib-3.3.1.tar.gz
-sha256  0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9  oauthlib-3.3.1.tar.gz
+md5  f1eb96f8a4257d715ec8af21a217a0c8  oauthlib-4.0.0.tar.gz
+sha256  efb274799819440f95b4ab3b818869f1ce9ae26c5beacba0201d1a1b76b54f86  oauthlib-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0028aa4763a8a0b09ca4c68d585263474cf9aaa6ec69ffbef3a31a9eccdd3b91  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index bbf59acedb..d001fcd071 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 3.3.1
+PYTHON_OAUTHLIB_VERSION = 4.0.0
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/0b/5f/19930f824ffeb0ad4372da4812c50edbd1434f678c90c2733e1188edfc63
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/7a/d8/a1bcc8ba112a627f8ffbdc212a78ce18d3ac07e91a5ca65d27918eee25a1
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

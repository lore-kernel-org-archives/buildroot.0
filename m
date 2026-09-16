Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B12C88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC82D6066A;
	Wed, 16 Sep 2026 18:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmHguP6i8gIn; Wed, 16 Sep 2026 18:53:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D60B8605E8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584785;
	b=sFOUmeImKhxdVFkL3RITUt2rqwPlhwauOT4GZHh1z4iAfjvOMs6sXDz/UMfvMVyVDKYg
	 NuXsZb6iXCyo6PgZrXSNrQJZOKiC8VhA9TMc66u7g3twXxs8n6CB5QfWLxzz4RogeBWeN
	 O2UQfP6D2+GeE+9fRvARBHYEUT1Y7PGqKLL82pGrIF86k353ZU25UsVRfAiPhgQJIzD7u
	 zKWvsV9PEAp7PxSs962poIBiFcxrb5jX2MsOrRU3f5+ppLbTcyAW6DQfanh+SrPEhSA9F
	 2fkEv/ji45f6bsgPnTK9fk0JfqZfScTOFJ+h436LXYaOZGhZmxfU4tCSD9p9nOv+j7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584785;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zjWNT/hhyB7ycnn3w2GMR112ydwvdxMSzizW7F70rYU=;
	b=ei/W+sHf6ISsmUS89D5JaOQIcxZdmKO/6buW3p5cMK67nQ7Vs76VzcLSFk8/mPm9MzAQ
	 UXM3xD5Lm597c+Bm0r0DON7Qm4mjj5EvALEH9lkcwEoFlCyP8dTvVhBYTnUHeDrHmkHpB
	 Jez8W/EW6pYiE2NWRprCwL40r8sniCMuB468egaKEiajbHytpSZQ93Be1KnSIlIzV1gxg
	 cFyOpo71mDN4Cla2OFgLcde6X/Giuc34eeq0IOhze3EN+mPM8a3Dr/EVvoI+kOJj26LRt
	 gQld5KURl/nMzh2dBSC+l0Sv3knHw8jrWklrB/p0n1dnJ2qcUN6r5KgCccMYHDJZulg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584784;
	bh=zjWNT/hhyB7ycnn3w2GMR112ydwvdxMSzizW7F70rYU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kfKkeDEHF/VzgPfiCDnyfPDRVBlY2sVrcXCSXjlbLYyfZME+2GR1o8dLByGS5oD/n
	 iXttn9PfGSkKxlWsX7i0RG+qZI5+LpdVMFH00rlHF3820LSW0059dGMMJLVi7g5DIH
	 9s8DbctxRJ/TP+fhecCmIjIk9DtlIW5KQYKB38WgNG3m2E8eYqcUlUsbltjN38fFzy
	 HIrpXPClg6uZbxNhLTiW5oouTqMUV8BWJPZDEGQcJQl87AYHB2U5Z9GOMrbtdOMxqq
	 sL5hK3pL8Ubrz96cFcJnDNP/7Sb77rq5Wc0H8Mox456Z8uT/Q2b5IhF75GNsfMgTB8
	 f1gGlk/zOc9cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D60B8605E8;
	Wed, 16 Sep 2026 18:53:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95E74493
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86ADD406EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iu08Rh3fvseu for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:53:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E5942406E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584782;
 b=R231CxAaCb9auenN3GjdzsIfpthTTqfvNxFEDIm+kDDgFGEwiCmuSPAv6gsONH/xk6lP
 QduZeWdkn4eQYglHUCUYBvkhJSjvXvbruWdOzVVlJ9xRR2Gx8EgBhowowZxk9p6E7oQZM
 nfZ9wADQffZ2Xl22HgK3t1HehV7Ubz6qYrN0K8bw8E+2/Lq5dSHxeffnoz9DCzbpuzKaP
 uc37o9xhGbebj2sUu5ubo2JZKrJcyWvjXkZc0NU2u+KDEQtgONpYjXHBFuPH+TF3FaQJE
 y71J0L1vPJ+9n+Y/E46R6gEEyHg7/wSCvrETVmVkIKuOWKqohP5vf3uPoMcDnDaPsFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584782;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NQHsBU3Ay9G3ftHcD8BuELOPwF0KGEzIQr5O1tdbluU=;
 b=hRG6dxoejP4MCV2Wm08hxrRRnR5eYdyBmzHmo04WMLB7I8XPVv9zVS79rfbazATvIa4h
 Pf982Zp9/nmrKFMLh7z/F6eBtjKeMHfCAOBxNCcDcJFBeDYBNBhIRlHAtMvtRuP4EeHNF
 5Zmb3gKWlsmoahEaEwrL9cM5oxp/5s0XxdZIoynhFvg4Lh7Bs49/8bWACaLqSOwOGKLWb
 V8x7g/4nno2DNwhcWU5OePKmVgVqiXsrTqb4uS6sfDKw832etoDmo/ZOonebO6hiecfjY
 6efMgITsmw1nL3jpZJyYPpIsiXwqqCfm/PTfShkdZC9QbHyN3LkDbvcA0jjm7MPH7iw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5942406E7
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:53:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7108196125; Wed, 16 Sep 2026 18:51:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 20:51:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e2e24a7404a1bdbc7e02c1307d268f8425dee7c
X-Git-Newrev: 05cbe542f9dad8868d7c9b257fe486d07c118630
X-Patchwork-Hint: ignore
Message-Id: <20260916185156.7108196125@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpam-pkcs11: bump to 0.6.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05cbe542f9dad8868d7c9b257fe486d07c118630
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Minor bugfix release, see here for a Changelog:
https://github.com/OpenSC/pam_pkcs11/releases/tag/pam_pkcs11-0.6.14

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpam-pkcs11/libpam-pkcs11.hash | 2 +-
 package/libpam-pkcs11/libpam-pkcs11.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpam-pkcs11/libpam-pkcs11.hash b/package/libpam-pkcs11/libpam-pkcs11.hash
index 95747afc08..01d6fcd17c 100644
--- a/package/libpam-pkcs11/libpam-pkcs11.hash
+++ b/package/libpam-pkcs11/libpam-pkcs11.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8a853f4e6e136ceecdcffad798570e3d6af2fde08e975656b2dc931989c35aff  pam_pkcs11-0.6.13.tar.gz
+sha256  5d9acdb177ea2dfd7b698f6cdcc485107888cc1c9dcd15227436831c098a4075  pam_pkcs11-0.6.14.tar.gz
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libpam-pkcs11/libpam-pkcs11.mk b/package/libpam-pkcs11/libpam-pkcs11.mk
index 4bad47f69a..0b952492cb 100644
--- a/package/libpam-pkcs11/libpam-pkcs11.mk
+++ b/package/libpam-pkcs11/libpam-pkcs11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPAM_PKCS11_VERSION = 0.6.13
+LIBPAM_PKCS11_VERSION = 0.6.14
 LIBPAM_PKCS11_SOURCE = pam_pkcs11-$(LIBPAM_PKCS11_VERSION).tar.gz
 LIBPAM_PKCS11_SITE = https://github.com/OpenSC/pam_pkcs11/archive/refs/tags
 LIBPAM_PKCS11_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
